target triple="i686"
%struct.Power = type {i32, i32}


define i32 @calcPower(i32 %base, i32 %exp)
{

bb1:
	%_retval_ = alloca i32
	%_P_base = alloca i32
	%_P_exp = alloca i32
	%result = alloca i32
	store i32 %base, i32* %_P_base
	store i32 %exp, i32* %_P_exp
	store i32 1, i32* %result
	br label %bb2

bb2:
	%u0 = load i32, i32* %_P_exp
	%u1 = icmp sgt i32 %u0, 0
	%u2 = zext i1 %u1 to i32
	%u8 = trunc i32 %u2 to i1
	br i1 %u8, label %bb3, label %bb4

bb3:
	%u3 = load i32, i32* %result
	%u4 = load i32, i32* %_P_base
	%u5 = mul i32 %u3, %u4
	store i32 %u5, i32* %result
	%u6 = load i32, i32* %_P_exp
	%u7 = sub i32 %u6, 1
	store i32 %u7, i32* %_P_exp
	br label %bb2

bb4:
	%u9 = load i32, i32* %result
	store i32 %u9, i32* %_retval_
	br label %bb0

bb0:
	%u10 = load i32, i32* %_retval_
	ret i32 %u10
}

define i32 @main()
{

bb6:
	%_retval_ = alloca i32
	%power = alloca %struct.Power*
	%input = alloca i32
	%result = alloca i32
	%exp = alloca i32
	%i = alloca i32
	store i32 0, i32* %result
	%u11 = call i8* @malloc_helper(i32 16)
	%u12 = bitcast i8* %u11 to %struct.Power*
	store %struct.Power* %u12, %struct.Power** %power
	%u13 = call i32 @read_helper()
	store i32 %u13, i32* %input
	%u14 = load i32, i32* %input
	%u15 = load %struct.Power*, %struct.Power** %power
	%u16 = getelementptr %struct.Power, %struct.Power* %u15, i1 0, i32 0
	store i32 %u14, i32* %u16
	%u17 = call i32 @read_helper()
	store i32 %u17, i32* %input
	%u18 = load i32, i32* %input
	%u19 = icmp slt i32 %u18, 0
	%u20 = zext i1 %u19 to i32
	%u21 = trunc i32 %u20 to i1
	br i1 %u21, label %bb7, label %bb8

bb7:
	store i32 -1, i32* %_retval_
	br label %bb5

bb8:
	br label %bb9

bb9:
	%u22 = load i32, i32* %input
	%u23 = load %struct.Power*, %struct.Power** %power
	%u24 = getelementptr %struct.Power, %struct.Power* %u23, i1 0, i32 1
	store i32 %u22, i32* %u24
	store i32 0, i32* %i
	br label %bb10

bb10:
	%u25 = load i32, i32* %i
	%u26 = icmp slt i32 %u25, 1000000
	%u27 = zext i1 %u26 to i32
	%u37 = trunc i32 %u27 to i1
	br i1 %u37, label %bb11, label %bb12

bb11:
	%u28 = load i32, i32* %i
	%u29 = add i32 %u28, 1
	store i32 %u29, i32* %i
	%u30 = load %struct.Power*, %struct.Power** %power
	%u31 = getelementptr %struct.Power, %struct.Power* %u30, i1 0, i32 0
	%u32 = load i32, i32* %u31
	%u33 = load %struct.Power*, %struct.Power** %power
	%u34 = getelementptr %struct.Power, %struct.Power* %u33, i1 0, i32 1
	%u35 = load i32, i32* %u34
	%u36 = call i32 @calcPower(i32 %u32, i32 %u35)
	store i32 %u36, i32* %result
	br label %bb10

bb12:
	%u38 = load i32, i32* %result
	%u39 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u39)
	store i32 1, i32* %_retval_
	br label %bb5

bb5:
	%u40 = load i32, i32* %_retval_
	ret i32 %u40
}

declare i8* @malloc_helper(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @read_helper()
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1

