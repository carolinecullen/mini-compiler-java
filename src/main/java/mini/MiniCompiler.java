package mini;//import ast.Declaration;
import ast.Program;
import ast.StructField;
import ast.SymbolEntry;
import cfg.CfgNode;
import cfg.OptimizeCFG;
import llvm.*;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

public class MiniCompiler
{
    public static int blockNum = 0;
    public static ParamSpecifier user_spec;
    private static boolean graph;
    public static boolean no_opt = false;
    public static ast.Program program;
    public static ArrayList<cfg.Cfg> cfgs = new ArrayList<>();
    private static ParamSpecifier print_output = ParamSpecifier.File;
    public static int phi_counter = 0;

    public enum ParamSpecifier {
        Stack,
        Symbol,
        LLVM,
        File
    }

   public static void main(String[] args) throws FileNotFoundException, UnsupportedEncodingException
   {
       parseParameters(args);

       CommonTokenStream tokens = new CommonTokenStream(createLexer());
       MiniParser parser = new MiniParser(tokens);
       ParseTree tree = parser.program();

       if (parser.getNumberOfSyntaxErrors() == 0)
       {
          /*
             This visitor will build an object representation of the AST
             in Java using the provided classes.
          */
           MiniToAstProgramVisitor programVisitor =
              new MiniToAstProgramVisitor();
           program = programVisitor.visit(tree);
           program.TypeCheck();

           if (user_spec == ParamSpecifier.Symbol) {
               program.printSymbolTable();
               return;
           }

           for(ast.Function f: program.funcs) {
               cfg.Cfg cur = new cfg.Cfg(f, false, null);
               cfgs.add(cur);
           }


           if (print_output == ParamSpecifier.LLVM) {
               PrintLLVMToStdOut(cfgs);
           } else {
               PrintWriter llvm_writer;
               llvm_writer = new PrintWriter(_llvmFile, "UTF-8");
               PrintLLVMToFile(cfgs, llvm_writer);
               llvm_writer.close();
           }

           PrintWriter arm_writer;
           arm_writer = new PrintWriter(_armFile, "UTF-8");

           arm.ArmCodegen.codegen(cfgs, arm_writer);
           arm_writer.close();

           if (graph) {
               CreateDotFormat(cfgs, program.funcs);
           }
      }
   }

    private static String _inputFile = null;
    public static String _llvmFile = null;
    public static String _armFile = null;

    private static void parseParameters(String [] args)
    {
       for (int i = 0; i < args.length; i++)
       {
          if (args[i].charAt(0) == '-')
          {
              // if stack then this means that optimize cannot also be selected because the optimization
              // requires SSA format
              if (args[i].equals("-stack") || args[i].equals("-s")) {
                  user_spec = ParamSpecifier.Stack;
              } else if (args[i].equals("-graph") || args[i].equals("-g")) {
                  graph = true;
              } else if (args[i].equals("-symbol") || args[i].equals("-S")) {
                  user_spec = ParamSpecifier.Symbol;
              } else if (args[i].equals("-llvm") || args[i].equals("-l")) {
                  print_output = ParamSpecifier.LLVM;
              } else if (args[i].equals("-nooptimizations") || args[i].equals("-no")) {
                  no_opt = true;
              } else {
                  System.err.println("unexpected option: " + args[i]);
                  System.exit(1);
              }
          } else if (_inputFile != null) {
             System.err.println("too many files specified");
             System.exit(1);
          }
          else
          {
              _inputFile = args[i];
              String input =_inputFile.substring(_inputFile.lastIndexOf('/')).substring(1);
              String result = input.substring(0, input.lastIndexOf('.'));
              _llvmFile = result + ".ll";
              _armFile = result + ".s";
          }
       }
    }

    private static void error(String msg)
    {
        System.err.println(msg);
        System.exit(1);
    }

    private static MiniLexer createLexer()
    {
        try
        {
           CharStream input;
           if (_inputFile == null)
           {
              input = CharStreams.fromStream(System.in);
           }
           else
           {
              input = CharStreams.fromFileName(_inputFile);
           }
           return new MiniLexer(input);
        }
        catch (java.io.IOException e)
       {
           System.err.println("file not found: " + _inputFile);
           System.exit(1);
           return null;
        }
    }

    // INSTRUCTIONS FOR GETTING DOT GRAPH:
    // go into cfgs.dot and remove all but one digraph
    //
    // dot -Tpng -otmp.png cfgs.dot
    // open tmp.png
    //
    // NOTE: much easier to read without printing the predecessors

    private static void CreateDotFormat(ArrayList<cfg.Cfg> cfgs, List<ast.Function> funcs) throws FileNotFoundException, UnsupportedEncodingException {
       PrintWriter writer = new PrintWriter("cfgs.dot", "UTF-8");
       int i = 0;
       for(cfg.Cfg c: cfgs) {
           writer.println("digraph " + funcs.get(i).name + " {");
           CreateSuccessorGraph(c, writer);
//           CreatePredeccessorGraph(c, writer);
           writer.println("}");
           i++;
       }

       writer.close();
   }

    private static void CreateSuccessorGraph(cfg.Cfg cur_graph, PrintWriter w) {
       for (cfg.CfgNode main_node: cur_graph.node_list) {
           for (cfg.CfgNode sucs_node: main_node.sucs) {
               w.println("    " + main_node.label + " -> " + sucs_node.label + ";");
           }
       }
   }

    private static void CreatePredeccessorGraph(cfg.Cfg cur_graph, PrintWriter w) {
        for (cfg.CfgNode main_node: cur_graph.node_list) {
            for (cfg.CfgNode preds_node: main_node.preds) {
                w.println("    " + main_node.label + " -> " + preds_node.label + ";");
            }
        }
    }

    private static void PrintLLVMToStdOut(ArrayList<cfg.Cfg> cfgs) {
        String header_ret = GetProgramHeader();
        String footer_ret = GetProgramFooter();
        System.out.println(header_ret);
        for(cfg.Cfg cur_graph: cfgs) {
            System.out.println(cur_graph.func_header);
            for (cfg.CfgNode main_node : cur_graph.node_list) {
                if(main_node.label.equals("bbentry")) {
                    continue;
                } else if (main_node.label.equals("bbexit")) {
                    System.out.println("\n" + "bb" + cur_graph.exit_num + ":");
                } else {
                    System.out.println("\n" + main_node.label + ":");
                }
                if(!(user_spec == ParamSpecifier.Stack)) {
                    for (InstructionLLVM i: main_node.phis) {
                        if(((PhiLLVM)i).value_block_pairs.size() != 0) {
                            System.out.println("\t" + i);
                        }
                    }
                }
                for (InstructionLLVM i: main_node.llvm_instructions) {
                    System.out.println("\t" + i.getInstruction());
                }
            }
            System.out.println("}\n");
        }
        System.out.println(footer_ret);
    }

    private static void PrintLLVMToFile(ArrayList<cfg.Cfg> cfgs, PrintWriter w) {
        String header_ret = GetProgramHeader();
        String footer_ret = GetProgramFooter();
        w.println(header_ret);
        for(cfg.Cfg cur_graph: cfgs) {
            w.println(cur_graph.func_header);
            for (cfg.CfgNode main_node : cur_graph.node_list) {
                if(main_node.label.equals("bbentry")) {
                    continue;
                } else if (main_node.label.equals("bbexit")) {
                    w.println("\n" + "bb" + cur_graph.exit_num + ":");
                } else {
                    w.println("\n" + main_node.label + ":");
                }
                if(!(user_spec == ParamSpecifier.Stack)) {
                    for (InstructionLLVM i: main_node.phis) {
                        if(((PhiLLVM)i).value_block_pairs.size() != 0) {
                            w.println("\t" + i);
                            putPhiValuesForOutOfBlock(((PhiLLVM)i), cur_graph);
                        }
                    }
                }
                for (InstructionLLVM i: main_node.llvm_instructions) {
                    w.println("\t" + i.getInstruction());
                }
            }
            w.println("}\n");
        }
        w.println(footer_ret);
    }

    private static void putPhiValuesForOutOfBlock(PhiLLVM phi, cfg.Cfg graph) {
        for(Tuple<ExprReturn, String> vbp: phi.value_block_pairs) {
            for(CfgNode node: graph.node_list) {
                if(node.label.equals(vbp.branch)) {
                    node.phi_values_out_of_block.put(vbp.name, phi.phi_number);
                }
            }
        }
    }

    private static String GetProgramHeader() {
        String ret_str = "target triple=\"i686\"\n";

        Set<String> struct_keys = Program.struct_table.keySet();
        for(String struct: struct_keys) {
            HashMap<String, StructField> cur_map = Program.struct_table.get(struct);
            Set<String> field_keys = cur_map.keySet();
            StructField [] dif_field = new StructField[field_keys.size()];

            for (String field: field_keys) {
                StructField ty = cur_map.get(field);
                dif_field[ty.index] = ty;
            }

            // adding struct declaration to top of file
            ret_str += "%struct.";
            ret_str += struct;
            ret_str += " = type {";

            int i = 1;
            for(StructField ty: dif_field) {

                if (i == dif_field.length) {
                    ret_str += ty.type.getLLVMType().getName();
                } else {
                    ret_str += ty.type.getLLVMType().getName();
                    ret_str += ", ";
                }
                i++;
            }
            ret_str += "}\n";

        }
        ret_str += "\n";

        Set<String> decs_keys = Program.glob_dec_symbol_table.keySet();
        for(String dec: decs_keys) {
            SymbolEntry cur_dec = Program.glob_dec_symbol_table.get(dec);

            // adding declaration to top of file
            ret_str += "@";
            ret_str += dec;
            ret_str += " = common global ";

            if(cur_dec.type.getLLVMType() instanceof IntLLVM) {
                ret_str += cur_dec.type.getLLVMType().getName();
                ret_str += " 0, align 8\n";
            } else if(cur_dec.type.getLLVMType() instanceof BoolLLVM) {
                ret_str += cur_dec.type.getLLVMType().getName();
                ret_str += " 0, align 8\n";
            } else {
                ret_str += cur_dec.type.getLLVMType().getName();
                ret_str += " null, align 8\n";
            }

        }

        return ret_str;
    }

    private static String GetProgramFooter() {
       String ret_str = "declare i8* @malloc_helper(i32)\n" +
               "declare void @free(i8*)\n" +
               "declare i32 @printf(i8*, ...)\n" +
               "declare i32 @read_helper()\n" +
               "@.println = private unnamed_addr constant [5 x i8] c\"%ld\\0A\\00\", align 1\n" +
               "@.print = private unnamed_addr constant [5 x i8] c\"%ld \\00\", align 1\n";
       return ret_str;
    }

}
