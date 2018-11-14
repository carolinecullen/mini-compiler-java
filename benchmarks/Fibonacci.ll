target triple="i686"


define i32 @computeFib(i32 %input)
{

bb1:
	%_retval_ = alloca i32
	%_P_input = alloca i32
	store i32 %input, i32* %_P_input
	%u0 = load i32, i32* %_P_input
	%u1 = icmp eq i32 %u0, 0
	%u2 = zext i1 %u1 to i32
	%u3 = trunc i32 %u2 to i1
	br i1 %u3, label %bb2, label %bb3

bb2:
	store i32 0, i32* %_retval_
	br label %bb0

bb3:
	%u4 = load i32, i32* %_P_input
	%u5 = icmp sle i32 %u4, 2
	%u6 = zext i1 %u5 to i32
	%u7 = trunc i32 %u6 to i1
	br i1 %u7, label %bb4, label %bb5

bb4:
	store i32 1, i32* %_retval_
	br label %bb0

bb5:
	%u8 = load i32, i32* %_P_input
	%u9 = sub i32 %u8, 1
	%u10 = call i32 @computeFib(i32 %u9)
	%u11 = load i32, i32* %_P_input
	%u12 = sub i32 %u11, 2
	%u13 = call i32 @computeFib(i32 %u12)
	%u14 = add i32 %u10, %u13
	store i32 %u14, i32* %_retval_
	br label %bb0

bb0:
	%u15 = load i32, i32* %_retval_
	ret i32 %u15
}

define i32 @main()
{

bb7:
	%_retval_ = alloca i32
	%input = alloca i32
	%u16 = call i32 @read_helper()
	store i32 %u16, i32* %input
	%u17 = load i32, i32* %input
	%u18 = call i32 @computeFib(i32 %u17)
	%u19 = load i32, i32* %input
	%u20 = call i32 @computeFib(i32 %u19)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u20)
	store i32 0, i32* %_retval_
	br label %bb6

bb6:
	%u21 = load i32, i32* %_retval_
	ret i32 %u21
}

declare i8* @malloc_helper(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @read_helper()
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1

