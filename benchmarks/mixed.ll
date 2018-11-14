target triple="i686"
%struct.foo = type {i32, i32, %struct.simple*}
%struct.simple = type {i32}

@globalfoo = common global %struct.foo* null, align 8

define void @tailrecursive(i32 %num)
{

bb1:
	%_P_num = alloca i32
	store i32 %num, i32* %_P_num
	%u0 = load i32, i32* %_P_num
	%u1 = icmp sle i32 %u0, 0
	%u2 = zext i1 %u1 to i32
	%u3 = trunc i32 %u2 to i1
	br i1 %u3, label %bb2, label %bb3

bb2:
	br label %bb0

bb3:
	br label %bb4

bb4:
	%u4 = load i32, i32* %_P_num
	%u5 = sub i32 %u4, 1
	call void @tailrecursive(i32 %u5)
	br label %bb0

bb0:
	ret void
}

define i32 @add(i32 %x, i32 %y)
{

bb6:
	%_retval_ = alloca i32
	%_P_x = alloca i32
	%_P_y = alloca i32
	store i32 %x, i32* %_P_x
	store i32 %y, i32* %_P_y
	%u6 = load i32, i32* %_P_x
	%u7 = load i32, i32* %_P_y
	%u8 = add i32 %u6, %u7
	store i32 %u8, i32* %_retval_
	br label %bb5

bb5:
	%u9 = load i32, i32* %_retval_
	ret i32 %u9
}

define void @domath(i32 %num)
{

bb8:
	%_P_num = alloca i32
	%math1 = alloca %struct.foo*
	%math2 = alloca %struct.foo*
	%tmp = alloca i32
	store i32 %num, i32* %_P_num
	%u10 = call i8* @malloc_helper(i32 24)
	%u11 = bitcast i8* %u10 to %struct.foo*
	store %struct.foo* %u11, %struct.foo** %math1
	%u12 = call i8* @malloc_helper(i32 8)
	%u13 = bitcast i8* %u12 to %struct.simple*
	%u14 = load %struct.foo*, %struct.foo** %math1
	%u15 = getelementptr %struct.foo, %struct.foo* %u14, i1 0, i32 2
	store %struct.simple* %u13, %struct.simple** %u15
	%u16 = call i8* @malloc_helper(i32 24)
	%u17 = bitcast i8* %u16 to %struct.foo*
	store %struct.foo* %u17, %struct.foo** %math2
	%u18 = call i8* @malloc_helper(i32 8)
	%u19 = bitcast i8* %u18 to %struct.simple*
	%u20 = load %struct.foo*, %struct.foo** %math2
	%u21 = getelementptr %struct.foo, %struct.foo* %u20, i1 0, i32 2
	store %struct.simple* %u19, %struct.simple** %u21
	%u22 = load i32, i32* %_P_num
	%u23 = load %struct.foo*, %struct.foo** %math1
	%u24 = getelementptr %struct.foo, %struct.foo* %u23, i1 0, i32 0
	store i32 %u22, i32* %u24
	%u25 = load %struct.foo*, %struct.foo** %math2
	%u26 = getelementptr %struct.foo, %struct.foo* %u25, i1 0, i32 0
	store i32 3, i32* %u26
	%u27 = load %struct.foo*, %struct.foo** %math1
	%u28 = getelementptr %struct.foo, %struct.foo* %u27, i1 0, i32 0
	%u29 = load i32, i32* %u28
	%u30 = load %struct.foo*, %struct.foo** %math1
	%u31 = getelementptr %struct.foo, %struct.foo* %u30, i1 0, i32 2
	%u32 = load %struct.simple*, %struct.simple** %u31
	%u33 = getelementptr %struct.simple, %struct.simple* %u32, i1 0, i32 0
	store i32 %u29, i32* %u33
	%u34 = load %struct.foo*, %struct.foo** %math2
	%u35 = getelementptr %struct.foo, %struct.foo* %u34, i1 0, i32 0
	%u36 = load i32, i32* %u35
	%u37 = load %struct.foo*, %struct.foo** %math2
	%u38 = getelementptr %struct.foo, %struct.foo* %u37, i1 0, i32 2
	%u39 = load %struct.simple*, %struct.simple** %u38
	%u40 = getelementptr %struct.simple, %struct.simple* %u39, i1 0, i32 0
	store i32 %u36, i32* %u40
	br label %bb9

bb9:
	%u41 = load i32, i32* %_P_num
	%u42 = icmp sgt i32 %u41, 0
	%u43 = zext i1 %u42 to i32
	%u80 = trunc i32 %u43 to i1
	br i1 %u80, label %bb10, label %bb11

bb10:
	%u44 = load %struct.foo*, %struct.foo** %math1
	%u45 = getelementptr %struct.foo, %struct.foo* %u44, i1 0, i32 0
	%u46 = load i32, i32* %u45
	%u47 = load %struct.foo*, %struct.foo** %math2
	%u48 = getelementptr %struct.foo, %struct.foo* %u47, i1 0, i32 0
	%u49 = load i32, i32* %u48
	%u50 = mul i32 %u46, %u49
	store i32 %u50, i32* %tmp
	%u51 = load i32, i32* %tmp
	%u52 = load %struct.foo*, %struct.foo** %math1
	%u53 = getelementptr %struct.foo, %struct.foo* %u52, i1 0, i32 2
	%u54 = load %struct.simple*, %struct.simple** %u53
	%u55 = getelementptr %struct.simple, %struct.simple* %u54, i1 0, i32 0
	%u56 = load i32, i32* %u55
	%u57 = mul i32 %u51, %u56
	%u58 = load %struct.foo*, %struct.foo** %math2
	%u59 = getelementptr %struct.foo, %struct.foo* %u58, i1 0, i32 0
	%u60 = load i32, i32* %u59
	%u61 = sdiv i32 %u57, %u60
	store i32 %u61, i32* %tmp
	%u62 = load %struct.foo*, %struct.foo** %math2
	%u63 = getelementptr %struct.foo, %struct.foo* %u62, i1 0, i32 2
	%u64 = load %struct.simple*, %struct.simple** %u63
	%u65 = getelementptr %struct.simple, %struct.simple* %u64, i1 0, i32 0
	%u66 = load i32, i32* %u65
	%u67 = load %struct.foo*, %struct.foo** %math1
	%u68 = getelementptr %struct.foo, %struct.foo* %u67, i1 0, i32 0
	%u69 = load i32, i32* %u68
	%u70 = call i32 @add(i32 %u66, i32 %u69)
	store i32 %u70, i32* %tmp
	%u71 = load %struct.foo*, %struct.foo** %math2
	%u72 = getelementptr %struct.foo, %struct.foo* %u71, i1 0, i32 0
	%u73 = load i32, i32* %u72
	%u74 = load %struct.foo*, %struct.foo** %math1
	%u75 = getelementptr %struct.foo, %struct.foo* %u74, i1 0, i32 0
	%u76 = load i32, i32* %u75
	%u77 = sub i32 %u73, %u76
	store i32 %u77, i32* %tmp
	%u78 = load i32, i32* %_P_num
	%u79 = sub i32 %u78, 1
	store i32 %u79, i32* %_P_num
	br label %bb9

bb11:
	%u81 = load %struct.foo*, %struct.foo** %math1
	%u82 = bitcast %struct.foo* %u81 to i8*
	call void @free(i8* %u82)
	%u83 = load %struct.foo*, %struct.foo** %math2
	%u84 = bitcast %struct.foo* %u83 to i8*
	call void @free(i8* %u84)
	br label %bb7

bb7:
	ret void
}

define void @objinstantiation(i32 %num)
{

bb13:
	%_P_num = alloca i32
	%tmp = alloca %struct.foo*
	store i32 %num, i32* %_P_num
	br label %bb14

bb14:
	%u85 = load i32, i32* %_P_num
	%u86 = icmp sgt i32 %u85, 0
	%u87 = zext i1 %u86 to i32
	%u94 = trunc i32 %u87 to i1
	br i1 %u94, label %bb15, label %bb16

bb15:
	%u88 = call i8* @malloc_helper(i32 24)
	%u89 = bitcast i8* %u88 to %struct.foo*
	store %struct.foo* %u89, %struct.foo** %tmp
	%u90 = load %struct.foo*, %struct.foo** %tmp
	%u91 = bitcast %struct.foo* %u90 to i8*
	call void @free(i8* %u91)
	%u92 = load i32, i32* %_P_num
	%u93 = sub i32 %u92, 1
	store i32 %u93, i32* %_P_num
	br label %bb14

bb16:
	br label %bb12

bb12:
	ret void
}

define i32 @ackermann(i32 %m, i32 %n)
{

bb18:
	%_retval_ = alloca i32
	%_P_m = alloca i32
	%_P_n = alloca i32
	store i32 %m, i32* %_P_m
	store i32 %n, i32* %_P_n
	%u95 = load i32, i32* %_P_m
	%u96 = icmp eq i32 %u95, 0
	%u97 = zext i1 %u96 to i32
	%u98 = trunc i32 %u97 to i1
	br i1 %u98, label %bb19, label %bb20

bb19:
	%u99 = load i32, i32* %_P_n
	%u100 = add i32 %u99, 1
	store i32 %u100, i32* %_retval_
	br label %bb17

bb20:
	br label %bb21

bb21:
	%u101 = load i32, i32* %_P_n
	%u102 = icmp eq i32 %u101, 0
	%u103 = zext i1 %u102 to i32
	%u104 = trunc i32 %u103 to i1
	br i1 %u104, label %bb22, label %bb23

bb22:
	%u105 = load i32, i32* %_P_m
	%u106 = sub i32 %u105, 1
	%u107 = call i32 @ackermann(i32 %u106, i32 1)
	store i32 %u107, i32* %_retval_
	br label %bb17

bb23:
	%u108 = load i32, i32* %_P_m
	%u109 = sub i32 %u108, 1
	%u110 = load i32, i32* %_P_m
	%u111 = load i32, i32* %_P_n
	%u112 = sub i32 %u111, 1
	%u113 = call i32 @ackermann(i32 %u110, i32 %u112)
	%u114 = call i32 @ackermann(i32 %u109, i32 %u113)
	store i32 %u114, i32* %_retval_
	br label %bb17

bb17:
	%u115 = load i32, i32* %_retval_
	ret i32 %u115
}

define i32 @main()
{

bb25:
	%_retval_ = alloca i32
	%a = alloca i32
	%b = alloca i32
	%c = alloca i32
	%d = alloca i32
	%e = alloca i32
	%u116 = call i32 @read_helper()
	store i32 %u116, i32* %a
	%u117 = call i32 @read_helper()
	store i32 %u117, i32* %b
	%u118 = call i32 @read_helper()
	store i32 %u118, i32* %c
	%u119 = call i32 @read_helper()
	store i32 %u119, i32* %d
	%u120 = call i32 @read_helper()
	store i32 %u120, i32* %e
	%u121 = load i32, i32* %a
	call void @tailrecursive(i32 %u121)
	%u122 = load i32, i32* %a
	%u123 = load i32, i32* %a
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u123)
	%u124 = load i32, i32* %b
	call void @domath(i32 %u124)
	%u125 = load i32, i32* %b
	%u126 = load i32, i32* %b
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u126)
	%u127 = load i32, i32* %c
	call void @objinstantiation(i32 %u127)
	%u128 = load i32, i32* %c
	%u129 = load i32, i32* %c
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u129)
	%u130 = load i32, i32* %d
	%u131 = load i32, i32* %e
	%u132 = call i32 @ackermann(i32 %u130, i32 %u131)
	%u133 = load i32, i32* %d
	%u134 = load i32, i32* %e
	%u135 = call i32 @ackermann(i32 %u133, i32 %u134)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u135)
	store i32 0, i32* %_retval_
	br label %bb24

bb24:
	%u136 = load i32, i32* %_retval_
	ret i32 %u136
}

declare i8* @malloc_helper(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @read_helper()
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1

