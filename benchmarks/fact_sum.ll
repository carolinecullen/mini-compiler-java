target triple="i686"


define i32 @sum(i32 %a, i32 %b)
{

bb1:
	%_retval_ = alloca i32
	%_P_a = alloca i32
	%_P_b = alloca i32
	store i32 %a, i32* %_P_a
	store i32 %b, i32* %_P_b
	%u0 = load i32, i32* %_P_a
	%u1 = load i32, i32* %_P_b
	%u2 = add i32 %u0, %u1
	store i32 %u2, i32* %_retval_
	br label %bb0

bb0:
	%u3 = load i32, i32* %_retval_
	ret i32 %u3
}

define i32 @fact(i32 %n)
{

bb3:
	%_retval_ = alloca i32
	%_P_n = alloca i32
	%t = alloca i32
	store i32 %n, i32* %_P_n
	%u4 = load i32, i32* %_P_n
	%u5 = icmp eq i32 %u4, 1
	%u6 = zext i1 %u5 to i32
	%u7 = load i32, i32* %_P_n
	%u8 = icmp eq i32 %u7, 0
	%u9 = zext i1 %u8 to i32
	%u10 = or i32 %u6, %u9
	%u11 = trunc i32 %u10 to i1
	br i1 %u11, label %bb4, label %bb5

bb4:
	store i32 1, i32* %_retval_
	br label %bb2

bb5:
	br label %bb6

bb6:
	%u12 = load i32, i32* %_P_n
	%u13 = icmp sle i32 %u12, 1
	%u14 = zext i1 %u13 to i32
	%u15 = trunc i32 %u14 to i1
	br i1 %u15, label %bb7, label %bb8

bb7:
	%u16 = load i32, i32* %_P_n
	%u17 = mul i32 -1, %u16
	%u18 = call i32 @fact(i32 %u17)
	store i32 %u18, i32* %_retval_
	br label %bb2

bb8:
	br label %bb9

bb9:
	%u19 = load i32, i32* %_P_n
	%u20 = load i32, i32* %_P_n
	%u21 = sub i32 %u20, 1
	%u22 = call i32 @fact(i32 %u21)
	%u23 = mul i32 %u19, %u22
	store i32 %u23, i32* %t
	%u24 = load i32, i32* %t
	store i32 %u24, i32* %_retval_
	br label %bb2

bb2:
	%u25 = load i32, i32* %_retval_
	ret i32 %u25
}

define i32 @main()
{

bb11:
	%_retval_ = alloca i32
	%num1 = alloca i32
	%num2 = alloca i32
	%flag = alloca i32
	store i32 0, i32* %flag
	br label %bb12

bb12:
	%u26 = load i32, i32* %flag
	%u27 = icmp ne i32 %u26, -1
	%u28 = zext i1 %u27 to i32
	%u42 = trunc i32 %u28 to i1
	br i1 %u42, label %bb13, label %bb14

bb13:
	%u29 = call i32 @read_helper()
	store i32 %u29, i32* %num1
	%u30 = call i32 @read_helper()
	store i32 %u30, i32* %num2
	%u31 = load i32, i32* %num1
	%u32 = call i32 @fact(i32 %u31)
	store i32 %u32, i32* %num1
	%u33 = load i32, i32* %num2
	%u34 = call i32 @fact(i32 %u33)
	store i32 %u34, i32* %num2
	%u35 = load i32, i32* %num1
	%u36 = load i32, i32* %num2
	%u37 = call i32 @sum(i32 %u35, i32 %u36)
	%u38 = load i32, i32* %num1
	%u39 = load i32, i32* %num2
	%u40 = call i32 @sum(i32 %u38, i32 %u39)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u40)
	%u41 = call i32 @read_helper()
	store i32 %u41, i32* %flag
	br label %bb12

bb14:
	store i32 0, i32* %_retval_
	br label %bb10

bb10:
	%u43 = load i32, i32* %_retval_
	ret i32 %u43
}

declare i8* @malloc_helper(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @read_helper()
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1

