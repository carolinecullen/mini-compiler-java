target triple="i686"
%struct.linkedNums = type {i32, %struct.linkedNums*}


define %struct.linkedNums* @getRands(i32 %seed, i32 %num)
{

bb1:
	%_retval_ = alloca %struct.linkedNums*
	%_P_seed = alloca i32
	%_P_num = alloca i32
	%cur = alloca i32
	%prev = alloca i32
	%curNode = alloca %struct.linkedNums*
	%prevNode = alloca %struct.linkedNums*
	store i32 %seed, i32* %_P_seed
	store i32 %num, i32* %_P_num
	store %struct.linkedNums* null, %struct.linkedNums** %curNode
	%u0 = load i32, i32* %_P_seed
	%u1 = load i32, i32* %_P_seed
	%u2 = mul i32 %u0, %u1
	store i32 %u2, i32* %cur
	%u3 = call i8* @malloc_helper(i32 16)
	%u4 = bitcast i8* %u3 to %struct.linkedNums*
	store %struct.linkedNums* %u4, %struct.linkedNums** %prevNode
	%u5 = load i32, i32* %cur
	%u6 = load %struct.linkedNums*, %struct.linkedNums** %prevNode
	%u7 = getelementptr %struct.linkedNums, %struct.linkedNums* %u6, i1 0, i32 0
	store i32 %u5, i32* %u7
	%u8 = load %struct.linkedNums*, %struct.linkedNums** %prevNode
	%u9 = getelementptr %struct.linkedNums, %struct.linkedNums* %u8, i1 0, i32 1
	store %struct.linkedNums* null, %struct.linkedNums** %u9
	%u10 = load i32, i32* %_P_num
	%u11 = sub i32 %u10, 1
	store i32 %u11, i32* %_P_num
	%u12 = load i32, i32* %cur
	store i32 %u12, i32* %prev
	br label %bb2

bb2:
	%u13 = load i32, i32* %_P_num
	%u14 = icmp sgt i32 %u13, 0
	%u15 = zext i1 %u14 to i32
	%u37 = trunc i32 %u15 to i1
	br i1 %u37, label %bb3, label %bb4

bb3:
	%u16 = load i32, i32* %prev
	%u17 = load i32, i32* %prev
	%u18 = mul i32 %u16, %u17
	%u19 = load i32, i32* %_P_seed
	%u20 = sdiv i32 %u18, %u19
	%u21 = load i32, i32* %_P_seed
	%u22 = sdiv i32 %u21, 2
	%u23 = mul i32 %u20, %u22
	%u24 = add i32 %u23, 1
	store i32 %u24, i32* %cur
	%u25 = call i8* @malloc_helper(i32 16)
	%u26 = bitcast i8* %u25 to %struct.linkedNums*
	store %struct.linkedNums* %u26, %struct.linkedNums** %curNode
	%u27 = load i32, i32* %cur
	%u28 = load %struct.linkedNums*, %struct.linkedNums** %curNode
	%u29 = getelementptr %struct.linkedNums, %struct.linkedNums* %u28, i1 0, i32 0
	store i32 %u27, i32* %u29
	%u30 = load %struct.linkedNums*, %struct.linkedNums** %prevNode
	%u31 = load %struct.linkedNums*, %struct.linkedNums** %curNode
	%u32 = getelementptr %struct.linkedNums, %struct.linkedNums* %u31, i1 0, i32 1
	store %struct.linkedNums* %u30, %struct.linkedNums** %u32
	%u33 = load %struct.linkedNums*, %struct.linkedNums** %curNode
	store %struct.linkedNums* %u33, %struct.linkedNums** %prevNode
	%u34 = load i32, i32* %_P_num
	%u35 = sub i32 %u34, 1
	store i32 %u35, i32* %_P_num
	%u36 = load i32, i32* %cur
	store i32 %u36, i32* %prev
	br label %bb2

bb4:
	%u38 = load %struct.linkedNums*, %struct.linkedNums** %curNode
	store %struct.linkedNums* %u38, %struct.linkedNums** %_retval_
	br label %bb0

bb0:
	%u39 = load %struct.linkedNums*, %struct.linkedNums** %_retval_
	ret %struct.linkedNums* %u39
}

define i32 @calcMean(%struct.linkedNums* %nums)
{

bb6:
	%_retval_ = alloca i32
	%_P_nums = alloca %struct.linkedNums*
	%sum = alloca i32
	%num = alloca i32
	%mean = alloca i32
	store %struct.linkedNums* %nums, %struct.linkedNums** %_P_nums
	store i32 0, i32* %sum
	store i32 0, i32* %num
	store i32 0, i32* %mean
	br label %bb7

bb7:
	%u40 = load %struct.linkedNums*, %struct.linkedNums** %_P_nums
	%u41 = icmp ne %struct.linkedNums* %u40, null
	%u42 = zext i1 %u41 to i32
	%u53 = trunc i32 %u42 to i1
	br i1 %u53, label %bb8, label %bb9

bb8:
	%u43 = load i32, i32* %num
	%u44 = add i32 %u43, 1
	store i32 %u44, i32* %num
	%u45 = load i32, i32* %sum
	%u46 = load %struct.linkedNums*, %struct.linkedNums** %_P_nums
	%u47 = getelementptr %struct.linkedNums, %struct.linkedNums* %u46, i1 0, i32 0
	%u48 = load i32, i32* %u47
	%u49 = add i32 %u45, %u48
	store i32 %u49, i32* %sum
	%u50 = load %struct.linkedNums*, %struct.linkedNums** %_P_nums
	%u51 = getelementptr %struct.linkedNums, %struct.linkedNums* %u50, i1 0, i32 1
	%u52 = load %struct.linkedNums*, %struct.linkedNums** %u51
	store %struct.linkedNums* %u52, %struct.linkedNums** %_P_nums
	br label %bb7

bb9:
	%u54 = load i32, i32* %num
	%u55 = icmp ne i32 %u54, 0
	%u56 = zext i1 %u55 to i32
	%u57 = trunc i32 %u56 to i1
	br i1 %u57, label %bb10, label %bb11

bb10:
	%u58 = load i32, i32* %sum
	%u59 = load i32, i32* %num
	%u60 = sdiv i32 %u58, %u59
	store i32 %u60, i32* %mean
	br label %bb12

bb11:
	br label %bb12

bb12:
	%u61 = load i32, i32* %mean
	store i32 %u61, i32* %_retval_
	br label %bb5

bb5:
	%u62 = load i32, i32* %_retval_
	ret i32 %u62
}

define i32 @approxSqrt(i32 %num)
{

bb14:
	%_retval_ = alloca i32
	%_P_num = alloca i32
	%guess = alloca i32
	%result = alloca i32
	%prev = alloca i32
	store i32 %num, i32* %_P_num
	store i32 1, i32* %guess
	%u63 = load i32, i32* %guess
	store i32 %u63, i32* %prev
	store i32 0, i32* %result
	br label %bb15

bb15:
	%u64 = load i32, i32* %result
	%u65 = load i32, i32* %_P_num
	%u66 = icmp slt i32 %u64, %u65
	%u67 = zext i1 %u66 to i32
	%u74 = trunc i32 %u67 to i1
	br i1 %u74, label %bb16, label %bb17

bb16:
	%u68 = load i32, i32* %guess
	%u69 = load i32, i32* %guess
	%u70 = mul i32 %u68, %u69
	store i32 %u70, i32* %result
	%u71 = load i32, i32* %guess
	store i32 %u71, i32* %prev
	%u72 = load i32, i32* %guess
	%u73 = add i32 %u72, 1
	store i32 %u73, i32* %guess
	br label %bb15

bb17:
	%u75 = load i32, i32* %prev
	store i32 %u75, i32* %_retval_
	br label %bb13

bb13:
	%u76 = load i32, i32* %_retval_
	ret i32 %u76
}

define void @approxSqrtAll(%struct.linkedNums* %nums)
{

bb19:
	%_P_nums = alloca %struct.linkedNums*
	store %struct.linkedNums* %nums, %struct.linkedNums** %_P_nums
	br label %bb20

bb20:
	%u77 = load %struct.linkedNums*, %struct.linkedNums** %_P_nums
	%u78 = icmp ne %struct.linkedNums* %u77, null
	%u79 = zext i1 %u78 to i32
	%u91 = trunc i32 %u79 to i1
	br i1 %u91, label %bb21, label %bb22

bb21:
	%u80 = load %struct.linkedNums*, %struct.linkedNums** %_P_nums
	%u81 = getelementptr %struct.linkedNums, %struct.linkedNums* %u80, i1 0, i32 0
	%u82 = load i32, i32* %u81
	%u83 = call i32 @approxSqrt(i32 %u82)
	%u84 = load %struct.linkedNums*, %struct.linkedNums** %_P_nums
	%u85 = getelementptr %struct.linkedNums, %struct.linkedNums* %u84, i1 0, i32 0
	%u86 = load i32, i32* %u85
	%u87 = call i32 @approxSqrt(i32 %u86)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u87)
	%u88 = load %struct.linkedNums*, %struct.linkedNums** %_P_nums
	%u89 = getelementptr %struct.linkedNums, %struct.linkedNums* %u88, i1 0, i32 1
	%u90 = load %struct.linkedNums*, %struct.linkedNums** %u89
	store %struct.linkedNums* %u90, %struct.linkedNums** %_P_nums
	br label %bb20

bb22:
	br label %bb18

bb18:
	ret void
}

define void @range(%struct.linkedNums* %nums)
{

bb24:
	%_P_nums = alloca %struct.linkedNums*
	%min = alloca i32
	%max = alloca i32
	%first = alloca i32
	store %struct.linkedNums* %nums, %struct.linkedNums** %_P_nums
	store i32 0, i32* %min
	store i32 0, i32* %max
	store i32 1, i32* %first
	br label %bb25

bb25:
	%u92 = load %struct.linkedNums*, %struct.linkedNums** %_P_nums
	%u93 = icmp ne %struct.linkedNums* %u92, null
	%u94 = zext i1 %u93 to i32
	%u126 = trunc i32 %u94 to i1
	br i1 %u126, label %bb26, label %bb36

bb26:
	%u95 = load i32, i32* %first
	%u96 = trunc i32 %u95 to i1
	br i1 %u96, label %bb27, label %bb28

bb27:
	%u97 = load %struct.linkedNums*, %struct.linkedNums** %_P_nums
	%u98 = getelementptr %struct.linkedNums, %struct.linkedNums* %u97, i1 0, i32 0
	%u99 = load i32, i32* %u98
	store i32 %u99, i32* %min
	%u100 = load %struct.linkedNums*, %struct.linkedNums** %_P_nums
	%u101 = getelementptr %struct.linkedNums, %struct.linkedNums* %u100, i1 0, i32 0
	%u102 = load i32, i32* %u101
	store i32 %u102, i32* %max
	store i32 1, i32* %first
	br label %bb35

bb28:
	%u103 = load %struct.linkedNums*, %struct.linkedNums** %_P_nums
	%u104 = getelementptr %struct.linkedNums, %struct.linkedNums* %u103, i1 0, i32 0
	%u105 = load i32, i32* %u104
	%u106 = load i32, i32* %min
	%u107 = icmp slt i32 %u105, %u106
	%u108 = zext i1 %u107 to i32
	%u109 = trunc i32 %u108 to i1
	br i1 %u109, label %bb29, label %bb30

bb29:
	%u110 = load %struct.linkedNums*, %struct.linkedNums** %_P_nums
	%u111 = getelementptr %struct.linkedNums, %struct.linkedNums* %u110, i1 0, i32 0
	%u112 = load i32, i32* %u111
	store i32 %u112, i32* %min
	br label %bb34

bb30:
	%u113 = load %struct.linkedNums*, %struct.linkedNums** %_P_nums
	%u114 = getelementptr %struct.linkedNums, %struct.linkedNums* %u113, i1 0, i32 0
	%u115 = load i32, i32* %u114
	%u116 = load i32, i32* %max
	%u117 = icmp sgt i32 %u115, %u116
	%u118 = zext i1 %u117 to i32
	%u119 = trunc i32 %u118 to i1
	br i1 %u119, label %bb31, label %bb32

bb31:
	%u120 = load %struct.linkedNums*, %struct.linkedNums** %_P_nums
	%u121 = getelementptr %struct.linkedNums, %struct.linkedNums* %u120, i1 0, i32 0
	%u122 = load i32, i32* %u121
	store i32 %u122, i32* %max
	br label %bb33

bb32:
	br label %bb33

bb33:
	br label %bb34

bb34:
	br label %bb35

bb35:
	%u123 = load %struct.linkedNums*, %struct.linkedNums** %_P_nums
	%u124 = getelementptr %struct.linkedNums, %struct.linkedNums* %u123, i1 0, i32 1
	%u125 = load %struct.linkedNums*, %struct.linkedNums** %u124
	store %struct.linkedNums* %u125, %struct.linkedNums** %_P_nums
	br label %bb25

bb36:
	%u127 = load i32, i32* %min
	%u128 = load i32, i32* %min
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u128)
	%u129 = load i32, i32* %max
	%u130 = load i32, i32* %max
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u130)
	br label %bb23

bb23:
	ret void
}

define i32 @main()
{

bb38:
	%_retval_ = alloca i32
	%seed = alloca i32
	%num = alloca i32
	%mean = alloca i32
	%nums = alloca %struct.linkedNums*
	%u131 = call i32 @read_helper()
	store i32 %u131, i32* %seed
	%u132 = call i32 @read_helper()
	store i32 %u132, i32* %num
	%u133 = load i32, i32* %seed
	%u134 = load i32, i32* %num
	%u135 = call %struct.linkedNums* @getRands(i32 %u133, i32 %u134)
	store %struct.linkedNums* %u135, %struct.linkedNums** %nums
	%u136 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%u137 = call i32 @calcMean(%struct.linkedNums* %u136)
	store i32 %u137, i32* %mean
	%u138 = load i32, i32* %mean
	%u139 = load i32, i32* %mean
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u139)
	%u140 = load %struct.linkedNums*, %struct.linkedNums** %nums
	call void @range(%struct.linkedNums* %u140)
	%u141 = load %struct.linkedNums*, %struct.linkedNums** %nums
	call void @approxSqrtAll(%struct.linkedNums* %u141)
	store i32 0, i32* %_retval_
	br label %bb37

bb37:
	%u142 = load i32, i32* %_retval_
	ret i32 %u142
}

declare i8* @malloc_helper(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @read_helper()
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1

