package arm;

import ast.Declaration;
import ast.FunctionType;
import ast.Program;
import ast.SymbolEntry;
import llvm.IdLLVM;
import llvm.InstructionLLVM;
import llvm.PhiLLVM;
import llvm.Register;
import mini.MiniCompiler;

import java.io.PrintWriter;
import java.util.ArrayList;

import static mini.MiniCompiler.user_spec;

public class ArmCodegen {

    public static void codegen(ArrayList<cfg.Cfg> cfgs, PrintWriter w) {
        PrintARMToFile(cfgs, w);
    }

    private static void PrintARMToFile(ArrayList<cfg.Cfg> cfgs, PrintWriter w) {
        String header_ret = GetARMHeader();
        String footer_ret = GetARMFooter();
        w.println(header_ret);
        for(cfg.Cfg cur_graph: cfgs) {
            w.print("\t.align 2\n\t.global\t");
            w.print(cur_graph.func_name);
            w.println(",4,4");
            w.println(cur_graph.func_name + ":");

            int blk_tracker = 0;
            for (cfg.CfgNode main_node : cur_graph.node_list) {
                if(main_node.label.equals("bbentry")) {
                    continue;
                } else if (main_node.label.equals("bbexit")) {
                    w.println("\n" + ".bb" + cur_graph.exit_num + ":");
                } else {
                    w.println("\n." + main_node.label + ":");
                }
                if(!(user_spec == MiniCompiler.ParamSpecifier.Stack)) {
                    for (InstructionLLVM i: main_node.phis) {
                        if(((PhiLLVM)i).value_block_pairs.size() != 0) {
                            ArrayList<String> instructs = i.getArm(main_node);
                            for(String instruct: instructs){
                                w.println("\t" + instruct);
                            }
                        }

                    }
                }
                for (InstructionLLVM i: main_node.llvm_instructions) {
                    ArrayList<String> instructs = i.getArm(main_node);

                    if(blk_tracker == 0) {
                        w.println("\tpush {fp, lr}\n\tadd fp, sp, #4");

                        int reg_num = 0;
                        for(Declaration decl: cur_graph.func_params) {
                            MovArm mov = new MovArm("r" + reg_num, new Register(new IdLLVM(decl.name, decl.type.getLLVMType(), SymbolEntry.Scope.PARAM)));
                            w.println( "\t" + mov);
                            reg_num++;
                        }

                    }
                    for(String instruct: instructs){
                        w.println("\t" + instruct);
                    }
                    blk_tracker++;
                }
            }

            w.println("\t.size ." + cur_graph.func_name + ", .-" + cur_graph.func_name + "\n\n");
        }
        w.println(footer_ret);
    }

    private static String GetARMHeader () {
        String ret_str = "\t.arch armv7-a\n";
        for(String key: Program.glob_symbol_table.keySet()) {
            if(!(Program.glob_symbol_table.get(key).type instanceof FunctionType)) {
                ret_str += "\t.comm\t";
                ret_str += key;

                // i have no idea what this four represents
                ret_str += ",4,4\n\n\t.text";
            }

        }
        return ret_str;
    }

    private static String GetARMFooter () {
        return "\t.section\t.rodata\n" +"\t.align\t2\n" +".PRINTLN_FMT:\n" +
                "\t.asciz\t\"%ld\\n\"\n" +
                "\t.align\t2\n" +
                ".PRINT_FMT:\n" +
                "\t.asciz\t\"%ld \"\n" +
                "\t.align\t2\n" +
                ".READ_FMT:\n" +
                "\t.asciz\t\"%ld\"\n" +
                "\t.comm\t.read_helper,4,4\n" +
                "\t.comm\t.malloc_helper,4,4\n" +
                "\t.global\t__aeabi_idiv";
    }
}
