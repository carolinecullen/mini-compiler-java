target triple="i686"
%struct.plate = type {i32, %struct.plate*}

@peg2 = common global %struct.plate* null, align 8
@peg3 = common global %struct.plate* null, align 8
@numMoves = common global i32 0, align 8
@peg1 = common global %struct.plate* null, align 8

define void @move(i32 %from, i32 %to)
{

bb1:
	%_P_from = alloca i32
	%_P_to = alloca i32
	%plateToMove = alloca %struct.plate*
	store i32 %from, i32* %_P_from
	store i32 %to, i32* %_P_to
	%u0 = load i32, i32* %_P_from
	%u1 = icmp eq i32 %u0, 1
	%u2 = zext i1 %u1 to i32
	%u3 = trunc i32 %u2 to i1
	br i1 %u3, label %bb2, label %bb3

bb2:
	%u4 = load %struct.plate*, %struct.plate** @peg1
	store %struct.plate* %u4, %struct.plate** %plateToMove
	%u5 = load %struct.plate*, %struct.plate** @peg1
	%u6 = getelementptr %struct.plate, %struct.plate* %u5, i1 0, i32 1
	%u7 = load %struct.plate*, %struct.plate** %u6
	store %struct.plate* %u7, %struct.plate** @peg1
	br label %bb7

bb3:
	%u8 = load i32, i32* %_P_from
	%u9 = icmp eq i32 %u8, 2
	%u10 = zext i1 %u9 to i32
	%u11 = trunc i32 %u10 to i1
	br i1 %u11, label %bb4, label %bb5

bb4:
	%u12 = load %struct.plate*, %struct.plate** @peg2
	store %struct.plate* %u12, %struct.plate** %plateToMove
	%u13 = load %struct.plate*, %struct.plate** @peg2
	%u14 = getelementptr %struct.plate, %struct.plate* %u13, i1 0, i32 1
	%u15 = load %struct.plate*, %struct.plate** %u14
	store %struct.plate* %u15, %struct.plate** @peg2
	br label %bb6

bb5:
	%u16 = load %struct.plate*, %struct.plate** @peg3
	store %struct.plate* %u16, %struct.plate** %plateToMove
	%u17 = load %struct.plate*, %struct.plate** @peg3
	%u18 = getelementptr %struct.plate, %struct.plate* %u17, i1 0, i32 1
	%u19 = load %struct.plate*, %struct.plate** %u18
	store %struct.plate* %u19, %struct.plate** @peg3
	br label %bb6

bb6:
	br label %bb7

bb7:
	%u20 = load i32, i32* %_P_to
	%u21 = icmp eq i32 %u20, 1
	%u22 = zext i1 %u21 to i32
	%u23 = trunc i32 %u22 to i1
	br i1 %u23, label %bb8, label %bb9

bb8:
	%u24 = load %struct.plate*, %struct.plate** @peg1
	%u25 = load %struct.plate*, %struct.plate** %plateToMove
	%u26 = getelementptr %struct.plate, %struct.plate* %u25, i1 0, i32 1
	store %struct.plate* %u24, %struct.plate** %u26
	%u27 = load %struct.plate*, %struct.plate** %plateToMove
	store %struct.plate* %u27, %struct.plate** @peg1
	br label %bb13

bb9:
	%u28 = load i32, i32* %_P_to
	%u29 = icmp eq i32 %u28, 2
	%u30 = zext i1 %u29 to i32
	%u31 = trunc i32 %u30 to i1
	br i1 %u31, label %bb10, label %bb11

bb10:
	%u32 = load %struct.plate*, %struct.plate** @peg2
	%u33 = load %struct.plate*, %struct.plate** %plateToMove
	%u34 = getelementptr %struct.plate, %struct.plate* %u33, i1 0, i32 1
	store %struct.plate* %u32, %struct.plate** %u34
	%u35 = load %struct.plate*, %struct.plate** %plateToMove
	store %struct.plate* %u35, %struct.plate** @peg2
	br label %bb12

bb11:
	%u36 = load %struct.plate*, %struct.plate** @peg3
	%u37 = load %struct.plate*, %struct.plate** %plateToMove
	%u38 = getelementptr %struct.plate, %struct.plate* %u37, i1 0, i32 1
	store %struct.plate* %u36, %struct.plate** %u38
	%u39 = load %struct.plate*, %struct.plate** %plateToMove
	store %struct.plate* %u39, %struct.plate** @peg3
	br label %bb12

bb12:
	br label %bb13

bb13:
	%u40 = load i32, i32* @numMoves
	%u41 = add i32 %u40, 1
	store i32 %u41, i32* @numMoves
	br label %bb0

bb0:
	ret void
}

define void @hanoi(i32 %n, i32 %from, i32 %to, i32 %other)
{

bb15:
	%_P_n = alloca i32
	%_P_from = alloca i32
	%_P_to = alloca i32
	%_P_other = alloca i32
	store i32 %n, i32* %_P_n
	store i32 %from, i32* %_P_from
	store i32 %to, i32* %_P_to
	store i32 %other, i32* %_P_other
	%u42 = load i32, i32* %_P_n
	%u43 = icmp eq i32 %u42, 1
	%u44 = zext i1 %u43 to i32
	%u45 = trunc i32 %u44 to i1
	br i1 %u45, label %bb16, label %bb17

bb16:
	%u46 = load i32, i32* %_P_from
	%u47 = load i32, i32* %_P_to
	call void @move(i32 %u46, i32 %u47)
	br label %bb18

bb17:
	%u48 = load i32, i32* %_P_n
	%u49 = sub i32 %u48, 1
	%u50 = load i32, i32* %_P_from
	%u51 = load i32, i32* %_P_other
	%u52 = load i32, i32* %_P_to
	call void @hanoi(i32 %u49, i32 %u50, i32 %u51, i32 %u52)
	%u53 = load i32, i32* %_P_from
	%u54 = load i32, i32* %_P_to
	call void @move(i32 %u53, i32 %u54)
	%u55 = load i32, i32* %_P_n
	%u56 = sub i32 %u55, 1
	%u57 = load i32, i32* %_P_other
	%u58 = load i32, i32* %_P_to
	%u59 = load i32, i32* %_P_from
	call void @hanoi(i32 %u56, i32 %u57, i32 %u58, i32 %u59)
	br label %bb18

bb18:
	br label %bb14

bb14:
	ret void
}

define void @printPeg(%struct.plate* %peg)
{

bb20:
	%_P_peg = alloca %struct.plate*
	%aPlate = alloca %struct.plate*
	store %struct.plate* %peg, %struct.plate** %_P_peg
	%u60 = load %struct.plate*, %struct.plate** %_P_peg
	store %struct.plate* %u60, %struct.plate** %aPlate
	br label %bb21

bb21:
	%u61 = load %struct.plate*, %struct.plate** %aPlate
	%u62 = icmp ne %struct.plate* %u61, null
	%u63 = zext i1 %u62 to i32
	%u73 = trunc i32 %u63 to i1
	br i1 %u73, label %bb22, label %bb23

bb22:
	%u64 = load %struct.plate*, %struct.plate** %aPlate
	%u65 = getelementptr %struct.plate, %struct.plate* %u64, i1 0, i32 0
	%u66 = load i32, i32* %u65
	%u67 = load %struct.plate*, %struct.plate** %aPlate
	%u68 = getelementptr %struct.plate, %struct.plate* %u67, i1 0, i32 0
	%u69 = load i32, i32* %u68
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u69)
	%u70 = load %struct.plate*, %struct.plate** %aPlate
	%u71 = getelementptr %struct.plate, %struct.plate* %u70, i1 0, i32 1
	%u72 = load %struct.plate*, %struct.plate** %u71
	store %struct.plate* %u72, %struct.plate** %aPlate
	br label %bb21

bb23:
	br label %bb19

bb19:
	ret void
}

define i32 @main()
{

bb25:
	%_retval_ = alloca i32
	%count = alloca i32
	%numPlates = alloca i32
	%aPlate = alloca %struct.plate*
	store %struct.plate* null, %struct.plate** @peg1
	store %struct.plate* null, %struct.plate** @peg2
	store %struct.plate* null, %struct.plate** @peg3
	store i32 0, i32* @numMoves
	%u74 = call i32 @read_helper()
	store i32 %u74, i32* %numPlates
	%u75 = load i32, i32* %numPlates
	%u76 = icmp sge i32 %u75, 1
	%u77 = zext i1 %u76 to i32
	%u78 = trunc i32 %u77 to i1
	br i1 %u78, label %bb26, label %bb27

bb26:
	%u79 = load i32, i32* %numPlates
	store i32 %u79, i32* %count
	br label %bb28

bb27:
	br label %bb34

bb28:
	%u80 = load i32, i32* %count
	%u81 = icmp ne i32 %u80, 0
	%u82 = zext i1 %u81 to i32
	%u94 = trunc i32 %u82 to i1
	br i1 %u94, label %bb29, label %bb30

bb29:
	%u83 = call i8* @malloc_helper(i32 16)
	%u84 = bitcast i8* %u83 to %struct.plate*
	store %struct.plate* %u84, %struct.plate** %aPlate
	%u85 = load i32, i32* %count
	%u86 = load %struct.plate*, %struct.plate** %aPlate
	%u87 = getelementptr %struct.plate, %struct.plate* %u86, i1 0, i32 0
	store i32 %u85, i32* %u87
	%u88 = load %struct.plate*, %struct.plate** @peg1
	%u89 = load %struct.plate*, %struct.plate** %aPlate
	%u90 = getelementptr %struct.plate, %struct.plate* %u89, i1 0, i32 1
	store %struct.plate* %u88, %struct.plate** %u90
	%u91 = load %struct.plate*, %struct.plate** %aPlate
	store %struct.plate* %u91, %struct.plate** @peg1
	%u92 = load i32, i32* %count
	%u93 = sub i32 %u92, 1
	store i32 %u93, i32* %count
	br label %bb28

bb30:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	%u95 = load %struct.plate*, %struct.plate** @peg1
	call void @printPeg(%struct.plate* %u95)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 2)
	%u96 = load %struct.plate*, %struct.plate** @peg2
	call void @printPeg(%struct.plate* %u96)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 3)
	%u97 = load %struct.plate*, %struct.plate** @peg3
	call void @printPeg(%struct.plate* %u97)
	%u98 = load i32, i32* %numPlates
	call void @hanoi(i32 %u98, i32 1, i32 3, i32 2)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	%u99 = load %struct.plate*, %struct.plate** @peg1
	call void @printPeg(%struct.plate* %u99)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 2)
	%u100 = load %struct.plate*, %struct.plate** @peg2
	call void @printPeg(%struct.plate* %u100)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 3)
	%u101 = load %struct.plate*, %struct.plate** @peg3
	call void @printPeg(%struct.plate* %u101)
	%u102 = load i32, i32* @numMoves
	%u103 = load i32, i32* @numMoves
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u103)
	br label %bb31

bb31:
	%u104 = load %struct.plate*, %struct.plate** @peg3
	%u105 = icmp ne %struct.plate* %u104, null
	%u106 = zext i1 %u105 to i32
	%u113 = trunc i32 %u106 to i1
	br i1 %u113, label %bb32, label %bb33

bb32:
	%u107 = load %struct.plate*, %struct.plate** @peg3
	store %struct.plate* %u107, %struct.plate** %aPlate
	%u108 = load %struct.plate*, %struct.plate** @peg3
	%u109 = getelementptr %struct.plate, %struct.plate* %u108, i1 0, i32 1
	%u110 = load %struct.plate*, %struct.plate** %u109
	store %struct.plate* %u110, %struct.plate** @peg3
	%u111 = load %struct.plate*, %struct.plate** %aPlate
	%u112 = bitcast %struct.plate* %u111 to i8*
	call void @free(i8* %u112)
	br label %bb31

bb33:
	br label %bb34

bb34:
	store i32 0, i32* %_retval_
	br label %bb24

bb24:
	%u114 = load i32, i32* %_retval_
	ret i32 %u114
}

declare i8* @malloc_helper(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @read_helper()
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1

