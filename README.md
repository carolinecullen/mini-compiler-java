# Mini Compiler
Mini compiler, written in Java includes translation to LLVM IR with Optimizations and a final translation into ARM.

Java Version: 10.0.0
LLVM Version: 10.0.0 (able to run locally on MacOS)

FOR FINAL CHECK: ./run-all.sh compiles and generates .ll and .s files for milestones 1,2,3,5 and checks their output agains the expected output. The script removes the .ll and .s files after passing a diff test, if this is not desired you can comment out the removal to inspect the files which will be generated and placed in benchmarks/"whatever filename you're testing".


Features
-------------

- Static Type Checking 
- Return Checking
- Stack based LLVM
- Register based LLVM
- Function Inlining Optimization on Register based LLVM
- ARM codegen from LLVM IR
- Beginnings Register Allocation by generating Gen and Kill sets as well as Live Out sets


Compiler Flags
-------------

default:: 
	register based llvm with optimizations

-s used to output stack based LLVM
-S prints symbol table to standard out
-llvm prints llvm to standard out
-graph creates cfgs.dot file that contains dot-formatted control flow graph
-no used to output register based llvm without optimization



File
-------------

default:: 
	llvm - prints to "file".ll
	arm - prints to "file".s
	graph - prints to cfgs.dot



Building
-------------

To compile and run the java program: 

``` {.sourceCode .sh}
java -cp ${CLASSPATH}:/YOUR/ABSOLUTE/PATH/.m2/repository/org/antlr/antlr4-runtime/4.7.1/antlr4-runtime-4.7.1.jar:/YOUR/ABSOLUTE/PATH/mini-compiler-java/target/classes mini.MiniCompiler "file".mini [FLAGS]

```

To compile and run clang: 

``` {.sourceCode .sh}
java -cp ${CLASSPATH}:/YOUR/ABSOLUTE/PATH/.m2/repository/org/antlr/antlr4-runtime/4.7.1/antlr4-runtime-4.7.1.jar:/YOUR/ABSOLUTE/PATH/mini-compiler-java/target/classes mini.MiniCompiler "file"/"file".mini [FLAGS]

clang "file".ll src/main/java/mini/malloc_helper.c src/main/java/mini/read_helper.c 

```

BEFORE YOU RUN SCRIPT: Change all /YOUR/ABSOLUTE/PATH/ in java compilation commands in script to the absolute path to your antlr jar and the location of the compiler

To run bash script with tests for Stack Based, Register Based, and Optimization: 

``` {.sourceCode .sh}
./run-all.sh

```

BEFORE YOU RUN SCRIPT: Change all /YOUR/ABSOLUTE/PATH/ in java compilation commands in script to the absolute path to your antlr jar and the location of the compiler

To run bash script with the stats of my compiler vs the stats of gcc: 

``` {.sourceCode .sh}
./run-all-stats.sh

```


To Get PNG Output of cfgs.dot
-------------

Go into cfgs.dot and remove all but one digraph.
Prints to tmp.png in mini-compiler-java file.
Does not print with predecessors. (easier to read)

``` {.sourceCode .sh}
dot -Tpng -otmp.png cfgs.dot
open tmp.png

```


