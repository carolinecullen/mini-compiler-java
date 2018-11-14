target triple="i686"


define i32 @wait(i32 %waitTime)
{

bb1:
	%_retval_ = alloca i32
	%_P_waitTime = alloca i32
	store i32 %waitTime, i32* %_P_waitTime
	br label %bb2

bb2:
	%u0 = load i32, i32* %_P_waitTime
	%u1 = icmp sgt i32 %u0, 0
	%u2 = zext i1 %u1 to i32
	%u5 = trunc i32 %u2 to i1
	br i1 %u5, label %bb3, label %bb4

bb3:
	%u3 = load i32, i32* %_P_waitTime
	%u4 = sub i32 %u3, 1
	store i32 %u4, i32* %_P_waitTime
	br label %bb2

bb4:
	store i32 0, i32* %_retval_
	br label %bb0

bb0:
	%u6 = load i32, i32* %_retval_
	ret i32 %u6
}

define i32 @power(i32 %base, i32 %exponent)
{

bb6:
	%_retval_ = alloca i32
	%_P_base = alloca i32
	%_P_exponent = alloca i32
	%product = alloca i32
	store i32 %base, i32* %_P_base
	store i32 %exponent, i32* %_P_exponent
	store i32 1, i32* %product
	br label %bb7

bb7:
	%u7 = load i32, i32* %_P_exponent
	%u8 = icmp sgt i32 %u7, 0
	%u9 = zext i1 %u8 to i32
	%u15 = trunc i32 %u9 to i1
	br i1 %u15, label %bb8, label %bb9

bb8:
	%u10 = load i32, i32* %product
	%u11 = load i32, i32* %_P_base
	%u12 = mul i32 %u10, %u11
	store i32 %u12, i32* %product
	%u13 = load i32, i32* %_P_exponent
	%u14 = sub i32 %u13, 1
	store i32 %u14, i32* %_P_exponent
	br label %bb7

bb9:
	%u16 = load i32, i32* %product
	store i32 %u16, i32* %_retval_
	br label %bb5

bb5:
	%u17 = load i32, i32* %_retval_
	ret i32 %u17
}

define i32 @recursiveDecimalSum(i32 %binaryNum, i32 %decimalSum, i32 %recursiveDepth)
{

bb11:
	%_retval_ = alloca i32
	%_P_binaryNum = alloca i32
	%_P_decimalSum = alloca i32
	%_P_recursiveDepth = alloca i32
	%tempNum = alloca i32
	%base = alloca i32
	%remainder = alloca i32
	store i32 %binaryNum, i32* %_P_binaryNum
	store i32 %decimalSum, i32* %_P_decimalSum
	store i32 %recursiveDepth, i32* %_P_recursiveDepth
	%u18 = load i32, i32* %_P_binaryNum
	%u19 = icmp sgt i32 %u18, 0
	%u20 = zext i1 %u19 to i32
	%u21 = trunc i32 %u20 to i1
	br i1 %u21, label %bb12, label %bb13

bb12:
	store i32 2, i32* %base
	%u22 = load i32, i32* %_P_binaryNum
	%u23 = sdiv i32 %u22, 10
	store i32 %u23, i32* %tempNum
	%u24 = load i32, i32* %tempNum
	%u25 = mul i32 %u24, 10
	store i32 %u25, i32* %tempNum
	%u26 = load i32, i32* %_P_binaryNum
	%u27 = load i32, i32* %tempNum
	%u28 = sub i32 %u26, %u27
	store i32 %u28, i32* %tempNum
	%u29 = load i32, i32* %tempNum
	%u30 = icmp eq i32 %u29, 1
	%u31 = zext i1 %u30 to i32
	%u32 = trunc i32 %u31 to i1
	br i1 %u32, label %bb14, label %bb15

bb13:
	br label %bb17

bb14:
	%u33 = load i32, i32* %_P_decimalSum
	%u34 = load i32, i32* %base
	%u35 = load i32, i32* %_P_recursiveDepth
	%u36 = call i32 @power(i32 %u34, i32 %u35)
	%u37 = add i32 %u33, %u36
	store i32 %u37, i32* %_P_decimalSum
	br label %bb16

bb15:
	br label %bb16

bb16:
	%u38 = load i32, i32* %_P_binaryNum
	%u39 = sdiv i32 %u38, 10
	%u40 = load i32, i32* %_P_decimalSum
	%u41 = load i32, i32* %_P_recursiveDepth
	%u42 = add i32 %u41, 1
	%u43 = call i32 @recursiveDecimalSum(i32 %u39, i32 %u40, i32 %u42)
	store i32 %u43, i32* %_retval_
	br label %bb10

bb17:
	%u44 = load i32, i32* %_P_decimalSum
	store i32 %u44, i32* %_retval_
	br label %bb10

bb10:
	%u45 = load i32, i32* %_retval_
	ret i32 %u45
}

define i32 @convertToDecimal(i32 %binaryNum)
{

bb19:
	%_retval_ = alloca i32
	%_P_binaryNum = alloca i32
	%recursiveDepth = alloca i32
	%decimalSum = alloca i32
	store i32 %binaryNum, i32* %_P_binaryNum
	store i32 0, i32* %recursiveDepth
	store i32 0, i32* %decimalSum
	%u46 = load i32, i32* %_P_binaryNum
	%u47 = load i32, i32* %decimalSum
	%u48 = load i32, i32* %recursiveDepth
	%u49 = call i32 @recursiveDecimalSum(i32 %u46, i32 %u47, i32 %u48)
	store i32 %u49, i32* %_retval_
	br label %bb18

bb18:
	%u50 = load i32, i32* %_retval_
	ret i32 %u50
}

define i32 @main()
{

bb21:
	%_retval_ = alloca i32
	%number = alloca i32
	%waitTime = alloca i32
	%u51 = call i32 @read_helper()
	store i32 %u51, i32* %number
	%u52 = load i32, i32* %number
	%u53 = call i32 @convertToDecimal(i32 %u52)
	store i32 %u53, i32* %number
	%u54 = load i32, i32* %number
	%u55 = load i32, i32* %number
	%u56 = mul i32 %u54, %u55
	store i32 %u56, i32* %waitTime
	br label %bb22

bb22:
	%u57 = load i32, i32* %waitTime
	%u58 = icmp sgt i32 %u57, 0
	%u59 = zext i1 %u58 to i32
	%u64 = trunc i32 %u59 to i1
	br i1 %u64, label %bb23, label %bb24

bb23:
	%u60 = load i32, i32* %waitTime
	%u61 = call i32 @wait(i32 %u60)
	%u62 = load i32, i32* %waitTime
	%u63 = sub i32 %u62, 1
	store i32 %u63, i32* %waitTime
	br label %bb22

bb24:
	%u65 = load i32, i32* %number
	%u66 = load i32, i32* %number
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u66)
	store i32 0, i32* %_retval_
	br label %bb20

bb20:
	%u67 = load i32, i32* %_retval_
	ret i32 %u67
}

declare i8* @malloc_helper(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @read_helper()
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1

