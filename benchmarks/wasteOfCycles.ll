target triple="i686"


define i32 @function(i32 %n)
{

bb1:
	%_retval_ = alloca i32
	%_P_n = alloca i32
	%i = alloca i32
	%j = alloca i32
	store i32 %n, i32* %_P_n
	%u0 = load i32, i32* %_P_n
	%u1 = icmp sle i32 %u0, 0
	%u2 = zext i1 %u1 to i32
	%u3 = trunc i32 %u2 to i1
	br i1 %u3, label %bb2, label %bb3

bb2:
	store i32 0, i32* %_retval_
	br label %bb0

bb3:
	br label %bb4

bb4:
	store i32 0, i32* %i
	br label %bb5

bb5:
	%u4 = load i32, i32* %i
	%u5 = load i32, i32* %_P_n
	%u6 = load i32, i32* %_P_n
	%u7 = mul i32 %u5, %u6
	%u8 = icmp slt i32 %u4, %u7
	%u9 = zext i1 %u8 to i32
	%u17 = trunc i32 %u9 to i1
	br i1 %u17, label %bb6, label %bb7

bb6:
	%u10 = load i32, i32* %i
	%u11 = load i32, i32* %_P_n
	%u12 = add i32 %u10, %u11
	store i32 %u12, i32* %j
	%u13 = load i32, i32* %j
	%u14 = load i32, i32* %j
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %u14)
	%u15 = load i32, i32* %i
	%u16 = add i32 %u15, 1
	store i32 %u16, i32* %i
	br label %bb5

bb7:
	%u18 = load i32, i32* %_P_n
	%u19 = sub i32 %u18, 1
	%u20 = call i32 @function(i32 %u19)
	store i32 %u20, i32* %_retval_
	br label %bb0

bb0:
	%u21 = load i32, i32* %_retval_
	ret i32 %u21
}

define i32 @main()
{

bb9:
	%_retval_ = alloca i32
	%num = alloca i32
	%u22 = call i32 @read_helper()
	store i32 %u22, i32* %num
	%u23 = load i32, i32* %num
	%u24 = call i32 @function(i32 %u23)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	store i32 0, i32* %_retval_
	br label %bb8

bb8:
	%u25 = load i32, i32* %_retval_
	ret i32 %u25
}

declare i8* @malloc_helper(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @read_helper()
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1

