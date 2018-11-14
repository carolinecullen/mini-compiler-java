target triple="i686"
%struct.IntHolder = type {i32}

@interval = common global i32 0, align 8
@end = common global i32 0, align 8

define i32 @multBy4xTimes(%struct.IntHolder* %num, i32 %timesLeft)
{

bb1:
	%_retval_ = alloca i32
	%_P_num = alloca %struct.IntHolder*
	%_P_timesLeft = alloca i32
	store %struct.IntHolder* %num, %struct.IntHolder** %_P_num
	store i32 %timesLeft, i32* %_P_timesLeft
	%u0 = load i32, i32* %_P_timesLeft
	%u1 = icmp sle i32 %u0, 0
	%u2 = zext i1 %u1 to i32
	%u3 = trunc i32 %u2 to i1
	br i1 %u3, label %bb2, label %bb3

bb2:
	%u4 = load %struct.IntHolder*, %struct.IntHolder** %_P_num
	%u5 = getelementptr %struct.IntHolder, %struct.IntHolder* %u4, i1 0, i32 0
	%u6 = load i32, i32* %u5
	store i32 %u6, i32* %_retval_
	br label %bb0

bb3:
	br label %bb4

bb4:
	%u7 = load %struct.IntHolder*, %struct.IntHolder** %_P_num
	%u8 = getelementptr %struct.IntHolder, %struct.IntHolder* %u7, i1 0, i32 0
	%u9 = load i32, i32* %u8
	%u10 = mul i32 4, %u9
	%u11 = load %struct.IntHolder*, %struct.IntHolder** %_P_num
	%u12 = getelementptr %struct.IntHolder, %struct.IntHolder* %u11, i1 0, i32 0
	store i32 %u10, i32* %u12
	%u13 = load %struct.IntHolder*, %struct.IntHolder** %_P_num
	%u14 = load i32, i32* %_P_timesLeft
	%u15 = sub i32 %u14, 1
	%u16 = call i32 @multBy4xTimes(%struct.IntHolder* %u13, i32 %u15)
	%u17 = load %struct.IntHolder*, %struct.IntHolder** %_P_num
	%u18 = getelementptr %struct.IntHolder, %struct.IntHolder* %u17, i1 0, i32 0
	%u19 = load i32, i32* %u18
	store i32 %u19, i32* %_retval_
	br label %bb0

bb0:
	%u20 = load i32, i32* %_retval_
	ret i32 %u20
}

define void @divideBy8(%struct.IntHolder* %num)
{

bb6:
	%_P_num = alloca %struct.IntHolder*
	store %struct.IntHolder* %num, %struct.IntHolder** %_P_num
	%u21 = load %struct.IntHolder*, %struct.IntHolder** %_P_num
	%u22 = getelementptr %struct.IntHolder, %struct.IntHolder* %u21, i1 0, i32 0
	%u23 = load i32, i32* %u22
	%u24 = sdiv i32 %u23, 2
	%u25 = load %struct.IntHolder*, %struct.IntHolder** %_P_num
	%u26 = getelementptr %struct.IntHolder, %struct.IntHolder* %u25, i1 0, i32 0
	store i32 %u24, i32* %u26
	%u27 = load %struct.IntHolder*, %struct.IntHolder** %_P_num
	%u28 = getelementptr %struct.IntHolder, %struct.IntHolder* %u27, i1 0, i32 0
	%u29 = load i32, i32* %u28
	%u30 = sdiv i32 %u29, 2
	%u31 = load %struct.IntHolder*, %struct.IntHolder** %_P_num
	%u32 = getelementptr %struct.IntHolder, %struct.IntHolder* %u31, i1 0, i32 0
	store i32 %u30, i32* %u32
	%u33 = load %struct.IntHolder*, %struct.IntHolder** %_P_num
	%u34 = getelementptr %struct.IntHolder, %struct.IntHolder* %u33, i1 0, i32 0
	%u35 = load i32, i32* %u34
	%u36 = sdiv i32 %u35, 2
	%u37 = load %struct.IntHolder*, %struct.IntHolder** %_P_num
	%u38 = getelementptr %struct.IntHolder, %struct.IntHolder* %u37, i1 0, i32 0
	store i32 %u36, i32* %u38
	br label %bb5

bb5:
	ret void
}

define i32 @main()
{

bb8:
	%_retval_ = alloca i32
	%start = alloca i32
	%countOuter = alloca i32
	%countInner = alloca i32
	%calc = alloca i32
	%tempAnswer = alloca i32
	%tempInterval = alloca i32
	%x = alloca %struct.IntHolder*
	%uselessVar = alloca i32
	%uselessVar2 = alloca i32
	%u39 = call i8* @malloc_helper(i32 8)
	%u40 = bitcast i8* %u39 to %struct.IntHolder*
	store %struct.IntHolder* %u40, %struct.IntHolder** %x
	store i32 1000000, i32* @end
	%u41 = call i32 @read_helper()
	store i32 %u41, i32* %start
	%u42 = call i32 @read_helper()
	store i32 %u42, i32* @interval
	%u43 = load i32, i32* %start
	%u44 = load i32, i32* %start
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u44)
	%u45 = load i32, i32* @interval
	%u46 = load i32, i32* @interval
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u46)
	store i32 0, i32* %countOuter
	store i32 0, i32* %countInner
	store i32 0, i32* %calc
	br label %bb9

bb9:
	%u47 = load i32, i32* %countOuter
	%u48 = icmp slt i32 %u47, 50
	%u49 = zext i1 %u48 to i32
	%u90 = trunc i32 %u49 to i1
	br i1 %u90, label %bb10, label %bb17

bb10:
	store i32 0, i32* %countInner
	br label %bb11

bb11:
	%u50 = load i32, i32* %countInner
	%u51 = load i32, i32* @end
	%u52 = icmp sle i32 %u50, %u51
	%u53 = zext i1 %u52 to i32
	%u87 = trunc i32 %u53 to i1
	br i1 %u87, label %bb12, label %bb16

bb12:
	%u54 = mul i32 1, 2
	%u55 = mul i32 %u54, 3
	%u56 = mul i32 %u55, 4
	%u57 = mul i32 %u56, 5
	%u58 = mul i32 %u57, 6
	%u59 = mul i32 %u58, 7
	%u60 = mul i32 %u59, 8
	%u61 = mul i32 %u60, 9
	%u62 = mul i32 %u61, 10
	%u63 = mul i32 %u62, 11
	store i32 %u63, i32* %calc
	%u64 = load i32, i32* %countInner
	%u65 = add i32 %u64, 1
	store i32 %u65, i32* %countInner
	%u66 = load i32, i32* %countInner
	%u67 = load %struct.IntHolder*, %struct.IntHolder** %x
	%u68 = getelementptr %struct.IntHolder, %struct.IntHolder* %u67, i1 0, i32 0
	store i32 %u66, i32* %u68
	%u69 = load %struct.IntHolder*, %struct.IntHolder** %x
	%u70 = getelementptr %struct.IntHolder, %struct.IntHolder* %u69, i1 0, i32 0
	%u71 = load i32, i32* %u70
	store i32 %u71, i32* %tempAnswer
	%u72 = load %struct.IntHolder*, %struct.IntHolder** %x
	%u73 = call i32 @multBy4xTimes(%struct.IntHolder* %u72, i32 2)
	%u74 = load %struct.IntHolder*, %struct.IntHolder** %x
	call void @divideBy8(%struct.IntHolder* %u74)
	%u75 = load i32, i32* @interval
	%u76 = sub i32 %u75, 1
	store i32 %u76, i32* %tempInterval
	%u77 = load i32, i32* %tempInterval
	%u78 = icmp sle i32 %u77, 0
	%u79 = zext i1 %u78 to i32
	store i32 %u79, i32* %uselessVar
	%u80 = load i32, i32* %tempInterval
	%u81 = icmp sle i32 %u80, 0
	%u82 = zext i1 %u81 to i32
	%u83 = trunc i32 %u82 to i1
	br i1 %u83, label %bb13, label %bb14

bb13:
	store i32 1, i32* %tempInterval
	br label %bb15

bb14:
	br label %bb15

bb15:
	%u84 = load i32, i32* %countInner
	%u85 = load i32, i32* %tempInterval
	%u86 = add i32 %u84, %u85
	store i32 %u86, i32* %countInner
	br label %bb11

bb16:
	%u88 = load i32, i32* %countOuter
	%u89 = add i32 %u88, 1
	store i32 %u89, i32* %countOuter
	br label %bb9

bb17:
	%u91 = load i32, i32* %countInner
	%u92 = load i32, i32* %countInner
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u92)
	%u93 = load i32, i32* %calc
	%u94 = load i32, i32* %calc
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u94)
	store i32 0, i32* %_retval_
	br label %bb7

bb7:
	%u95 = load i32, i32* %_retval_
	ret i32 %u95
}

declare i8* @malloc_helper(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @read_helper()
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1

