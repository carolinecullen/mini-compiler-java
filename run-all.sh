#!/bin/bash
# A simple for running benchmarks and checking them script

printf "Running benchmarks.....\n\n"

cd benchmarks

for file in * ; 
do 
	[ -e a.out ] && rm a.out

	if [ $file != "a.out" ];
	then 
		printf "$file test:\n\n"
		java -cp ${CLASSPATH}:/Users/carolinecullen/.m2/repository/org/antlr/antlr4-runtime/4.7.1/antlr4-runtime-4.7.1.jar:/Users/carolinecullen/Documents/mini-compiler-java/target/classes mini.MiniCompiler $file/$file.mini
		if [ -e $file.ll ];
		then 

			clang $file.ll ../src/main/java/mini/malloc_helper.c ../src/main/java/mini/read_helper.c
			if [ -e a.out ];
			then 
				chmod 777 $file/input
				./a.out < $file/input > $file.results
				diff $file.results $file/output | head -n 15
				# [ -e $file.results ] && rm $file.results
			fi
			# [ -e $file.ll ] && rm $file.ll
		fi
		printf "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
	fi
done
exit
