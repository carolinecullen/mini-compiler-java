target triple="i686"


define i32 @mod(i32 %a, i32 %b)
{

bb1:
	%_retval_ = alloca i32
	%_P_a = alloca i32
	%_P_b = alloca i32
	store i32 %a, i32* %_P_a
	store i32 %b, i32* %_P_b
	%u0 = load i32, i32* %_P_a
	%u1 = load i32, i32* %_P_a
	%u2 = load i32, i32* %_P_b
	%u3 = sdiv i32 %u1, %u2
	%u4 = load i32, i32* %_P_b
	%u5 = mul i32 %u3, %u4
	%u6 = sub i32 %u0, %u5
	store i32 %u6, i32* %_retval_
	br label %bb0

bb0:
	%u7 = load i32, i32* %_retval_
	ret i32 %u7
}

define void @hailstone(i32 %n)
{

bb3:
	%_P_n = alloca i32
	store i32 %n, i32* %_P_n
	br label %bb4

bb4:
	br i1 1, label %bb5, label %bb12

bb5:
	%u8 = load i32, i32* %_P_n
	%u9 = load i32, i32* %_P_n
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %u9)
	%u10 = load i32, i32* %_P_n
	%u11 = call i32 @mod(i32 %u10, i32 2)
	%u12 = icmp eq i32 %u11, 1
	%u13 = zext i1 %u12 to i32
	%u14 = trunc i32 %u13 to i1
	br i1 %u14, label %bb6, label %bb7

bb6:
	%u15 = load i32, i32* %_P_n
	%u16 = mul i32 3, %u15
	%u17 = add i32 %u16, 1
	store i32 %u17, i32* %_P_n
	br label %bb8

bb7:
	%u18 = load i32, i32* %_P_n
	%u19 = sdiv i32 %u18, 2
	store i32 %u19, i32* %_P_n
	br label %bb8

bb8:
	%u20 = load i32, i32* %_P_n
	%u21 = icmp sle i32 %u20, 1
	%u22 = zext i1 %u21 to i32
	%u23 = trunc i32 %u22 to i1
	br i1 %u23, label %bb9, label %bb10

bb9:
	%u24 = load i32, i32* %_P_n
	%u25 = load i32, i32* %_P_n
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u25)
	br label %bb2

bb10:
	br label %bb11

bb11:
	br label %bb4

bb12:
	br label %bb2

bb2:
	ret void
}

define i32 @main()
{

bb14:
	%_retval_ = alloca i32
	%num = alloca i32
	%u26 = call i32 @read_helper()
	store i32 %u26, i32* %num
	%u27 = load i32, i32* %num
	call void @hailstone(i32 %u27)
	store i32 0, i32* %_retval_
	br label %bb13

bb13:
	%u28 = load i32, i32* %_retval_
	ret i32 %u28
}

declare i8* @malloc_helper(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @read_helper()
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1

