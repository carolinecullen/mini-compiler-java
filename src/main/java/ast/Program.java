package ast;

import java.util.List;
import java.util.HashMap;

public class Program
{
    private final List<TypeDeclaration> types;
    private final List<Declaration> decls;
    public final List<Function> funcs;
    public static HashMap<String, SymbolEntry> glob_symbol_table;
    public static HashMap<String, SymbolEntry> glob_dec_symbol_table;
    public static HashMap<String, HashMap<String, StructField>> struct_table;


   public Program(List<TypeDeclaration> types, List<Declaration> decls,
      List<Function> funcs)
   {
       HashMap <String, SymbolEntry> dec_table = new HashMap<>();
       this.types = types;
       this.decls = decls;
       this.funcs = funcs;
       glob_symbol_table = CreateGlobSymbolTable(dec_table);
       struct_table = CreateStructTable();
   }

   private HashMap CreateGlobSymbolTable (HashMap <String, SymbolEntry> dec_table) {
       HashMap <String, SymbolEntry> init_table = new HashMap<>();
       for (Declaration decl: decls)
       {
            init_table.put(decl.name, new SymbolEntry(decl.type, SymbolEntry.Scope.GLOB));
            dec_table.put(decl.name, new SymbolEntry(decl.type, SymbolEntry.Scope.GLOB));
       }
       glob_dec_symbol_table = dec_table;

//       for (TypeDeclaration type: types)
//       {
//            init_table.put(type.name, new SymbolEntry(new StructType(0, type.name), SymbolEntry.Scope.GLOB));
//       }

       boolean find_main = false;
       for (Function func: funcs)
       {
           // for function parameters and return type for matching up on function calls
           if (func.name.equals("main")) {
               find_main = true;
           }

           init_table.put(func.name, new SymbolEntry(new FunctionType(func.params, func.retType), SymbolEntry.Scope.GLOB));
       }

       if (!find_main) {
           System.err.println("Main function not found in program");
           System.exit(1);
           return null;
       } else {
           return init_table;
       }
   }

    private HashMap CreateStructTable () {
       // Hashmap in hashmap works because both layers are arbitary
        HashMap <String, HashMap<String, StructField>> outer_table = new HashMap<>();

        for (TypeDeclaration type: types)
        {
            HashMap<String, StructField> inner_table = new HashMap<>();
            int i = 0;
            for (Declaration field_val: type.fields) {
                inner_table.put(field_val.name, new StructField(field_val.type, i));
                i++;
            }
            outer_table.put(type.name, inner_table);
        }

        return outer_table;
    }

    public Type TypeCheck () {
       for (Function f: funcs)
       {
           f.TypeCheck();
       }
       return null;
    }

    public void printSymbolTable(){
       System.out.println();
       System.out.println();
       System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~SYMBOL TABLE~~~~~~~~~~~~~~~~~~~~~~~~~~");
       System.out.println();
        glob_symbol_table.forEach((k,v) -> {
           System.out.println("Symbol name: " + k + calcSpaces(k, 6)
                   + "  Type: " + getClassName(v.type).substring(10)
                   + calcSpaces(getClassName(v.type), 25)
                   + "  Scope: " + v.scope.name() + calcSpaces(v.scope.name(), 10) + "Return type: " + printFunctionTypes(v.type))
                    ;
       });
    }

    private String calcSpaces(String s, int val) {
       String result = "";
       for (int i = 0; i < (val - s.length()); i++){
           result += " ";
       }
       return result;
    }

    private String getClassName(Type v) {
       return v.getClass().toString();
    }

    private String printFunctionTypes(Type v) {
       String funcType = "";
       String returnType = "";
       String paramList = "";
       String result = "";
       if (v instanceof FunctionType) {
           returnType = ((FunctionType) v).return_type.getClass().toString();
           result += returnType.substring(10);
       }
       return result;
    }
}
