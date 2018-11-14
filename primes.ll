target triple="i686"


define i32 @isqrt(i32 %a)
{

bb1:
	%_retval_ = alloca i32
	%_P_a = alloca i32
	%square = alloca i32
	%delta = alloca i32
	store i32 %a, i32* %_P_a
	store i32 1, i32* %square
	store i32 3, i32* %delta
	br label %bb2

bb2:
	%u0 = load i32, i32* %square
	%u1 = load i32, i32* %_P_a
	%u2 = icmp sle i32 %u0, %u1
	%u3 = zext i1 %u2 to i32
	%u9 = trunc i32 %u3 to i1
	br i1 %u9, label %bb3, label %bb4

bb3:
	%u4 = load i32, i32* %square
	%u5 = load i32, i32* %delta
	%u6 = add i32 %u4, %u5
	store i32 %u6, i32* %square
	%u7 = load i32, i32* %delta
	%u8 = add i32 %u7, 2
	store i32 %u8, i32* %delta
	br label %bb2

bb4:
	%u10 = load i32, i32* %delta
	%u11 = sdiv i32 %u10, 2
	%u12 = sub i32 %u11, 1
	store i32 %u12, i32* %_retval_
	br label %bb0

bb0:
	%u13 = load i32, i32* %_retval_
	ret i32 %u13
}

define i32 @prime(i32 %a)
{

bb6:
	%_retval_ = alloca i32
	%_P_a = alloca i32
	%max = alloca i32
	%divisor = alloca i32
	%remainder = alloca i32
	store i32 %a, i32* %_P_a
	%u14 = load i32, i32* %_P_a
	%u15 = icmp slt i32 %u14, 2
	%u16 = zext i1 %u15 to i32
	%u17 = trunc i32 %u16 to i1
	br i1 %u17, label %bb7, label %bb8

bb7:
	store i32 1, i32* %_retval_
	br label %bb5

bb8:
	%u18 = load i32, i32* %_P_a
	%u19 = call i32 @isqrt(i32 %u18)
	store i32 %u19, i32* %max
	store i32 2, i32* %divisor
	br label %bb9

bb9:
	%u20 = load i32, i32* %divisor
	%u21 = load i32, i32* %max
	%u22 = icmp sle i32 %u20, %u21
	%u23 = zext i1 %u22 to i32
	%u37 = trunc i32 %u23 to i1
	br i1 %u37, label %bb10, label %bb14

bb10:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	%u24 = load i32, i32* %_P_a
	%u25 = load i32, i32* %_P_a
	%u26 = load i32, i32* %divisor
	%u27 = sdiv i32 %u25, %u26
	%u28 = load i32, i32* %divisor
	%u29 = mul i32 %u27, %u28
	%u30 = sub i32 %u24, %u29
	store i32 %u30, i32* %remainder
	%u31 = load i32, i32* %remainder
	%u32 = icmp eq i32 %u31, 0
	%u33 = zext i1 %u32 to i32
	%u34 = trunc i32 %u33 to i1
	br i1 %u34, label %bb11, label %bb12

bb11:
	store i32 1, i32* %_retval_
	br label %bb5

bb12:
	br label %bb13

bb13:
	%u35 = load i32, i32* %divisor
	%u36 = add i32 %u35, 1
	store i32 %u36, i32* %divisor
	br label %bb9

bb14:
	store i32 1, i32* %_retval_
	br label %bb5

bb5:
	%u38 = load i32, i32* %_retval_
	ret i32 %u38
}

define i32 @main()
{

bb16:
	%_retval_ = alloca i32
	%limit = alloca i32
	%a = alloca i32
	%u39 = call i32 @read_helper()
	store i32 %u39, i32* %limit
	store i32 0, i32* %a
	br label %bb17

bb17:
	%u40 = load i32, i32* %a
	%u41 = load i32, i32* %limit
	%u42 = icmp sle i32 %u40, %u41
	%u43 = zext i1 %u42 to i32
	%u51 = trunc i32 %u43 to i1
	br i1 %u51, label %bb18, label %bb22

bb18:
	%u44 = load i32, i32* %a
	%u45 = call i32 @prime(i32 %u44)
	%u46 = trunc i32 %u45 to i1
	br i1 %u46, label %bb19, label %bb20

bb19:
	%u47 = load i32, i32* %a
	%u48 = load i32, i32* %a
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u48)
	br label %bb21

bb20:
	br label %bb21

bb21:
	%u49 = load i32, i32* %a
	%u50 = add i32 %u49, 1
	store i32 %u50, i32* %a
	br label %bb17

bb22:
	store i32 0, i32* %_retval_
	br label %bb15

bb15:
	%u52 = load i32, i32* %_retval_
	ret i32 %u52
}

declare i8* @malloc_helper(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @read_helper()
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1

