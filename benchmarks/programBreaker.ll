target triple="i686"

@GLOBAL = common global i32 0, align 8
@count = common global i32 0, align 8

define i32 @fun2(i32 %x, i32 %y)
{

bb1:
	%_retval_ = alloca i32
	%_P_x = alloca i32
	%_P_y = alloca i32
	store i32 %x, i32* %_P_x
	store i32 %y, i32* %_P_y
	%u0 = load i32, i32* %_P_x
	%u1 = icmp eq i32 %u0, 0
	%u2 = zext i1 %u1 to i32
	%u3 = trunc i32 %u2 to i1
	br i1 %u3, label %bb2, label %bb3

bb2:
	%u4 = load i32, i32* %_P_y
	store i32 %u4, i32* %_retval_
	br label %bb0

bb3:
	%u5 = load i32, i32* %_P_x
	%u6 = sub i32 %u5, 1
	%u7 = load i32, i32* %_P_y
	%u8 = call i32 @fun2(i32 %u6, i32 %u7)
	store i32 %u8, i32* %_retval_
	br label %bb0

bb0:
	%u9 = load i32, i32* %_retval_
	ret i32 %u9
}

define i32 @fun1(i32 %x, i32 %y, i32 %z)
{

bb5:
	%_retval_ = alloca i32
	%_P_x = alloca i32
	%_P_y = alloca i32
	%_P_z = alloca i32
	%retVal = alloca i32
	store i32 %x, i32* %_P_x
	store i32 %y, i32* %_P_y
	store i32 %z, i32* %_P_z
	%u10 = add i32 5, 6
	%u11 = load i32, i32* %_P_x
	%u12 = mul i32 %u11, 2
	%u13 = sub i32 %u10, %u12
	%u14 = load i32, i32* %_P_y
	%u15 = sdiv i32 4, %u14
	%u16 = add i32 %u13, %u15
	%u17 = load i32, i32* %_P_z
	%u18 = add i32 %u16, %u17
	store i32 %u18, i32* %retVal
	%u19 = load i32, i32* %retVal
	%u20 = load i32, i32* %_P_y
	%u21 = icmp sgt i32 %u19, %u20
	%u22 = zext i1 %u21 to i32
	%u23 = trunc i32 %u22 to i1
	br i1 %u23, label %bb6, label %bb7

bb6:
	%u24 = load i32, i32* %retVal
	%u25 = load i32, i32* %_P_x
	%u26 = call i32 @fun2(i32 %u24, i32 %u25)
	store i32 %u26, i32* %_retval_
	br label %bb4

bb7:
	%u27 = icmp slt i32 5, 6
	%u28 = zext i1 %u27 to i32
	%u29 = load i32, i32* %retVal
	%u30 = load i32, i32* %_P_y
	%u31 = icmp sle i32 %u29, %u30
	%u32 = zext i1 %u31 to i32
	%u33 = and i32 %u28, %u32
	%u34 = trunc i32 %u33 to i1
	br i1 %u34, label %bb8, label %bb9

bb8:
	%u35 = load i32, i32* %retVal
	%u36 = load i32, i32* %_P_y
	%u37 = call i32 @fun2(i32 %u35, i32 %u36)
	store i32 %u37, i32* %_retval_
	br label %bb4

bb9:
	br label %bb10

bb10:
	br label %bb11

bb11:
	%u38 = load i32, i32* %retVal
	store i32 %u38, i32* %_retval_
	br label %bb4

bb4:
	%u39 = load i32, i32* %_retval_
	ret i32 %u39
}

define i32 @main()
{

bb13:
	%_retval_ = alloca i32
	%i = alloca i32
	store i32 0, i32* %i
	%u40 = call i32 @read_helper()
	store i32 %u40, i32* %i
	br label %bb14

bb14:
	%u41 = load i32, i32* %i
	%u42 = icmp slt i32 %u41, 10000
	%u43 = zext i1 %u42 to i32
	%u50 = trunc i32 %u43 to i1
	br i1 %u50, label %bb15, label %bb16

bb15:
	%u44 = load i32, i32* %i
	%u45 = call i32 @fun1(i32 3, i32 %u44, i32 5)
	%u46 = load i32, i32* %i
	%u47 = call i32 @fun1(i32 3, i32 %u46, i32 5)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u47)
	%u48 = load i32, i32* %i
	%u49 = add i32 %u48, 1
	store i32 %u49, i32* %i
	br label %bb14

bb16:
	store i32 0, i32* %_retval_
	br label %bb12

bb12:
	%u51 = load i32, i32* %_retval_
	ret i32 %u51
}

declare i8* @malloc_helper(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @read_helper()
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1

