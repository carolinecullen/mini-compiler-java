target triple="i686"
%struct.Node = type {i32, %struct.Node*, %struct.Node*}

@swapped = common global i32 0, align 8

define i32 @compare(%struct.Node* %a, %struct.Node* %b)
{

bb1:
	%_retval_ = alloca i32
	%_P_a = alloca %struct.Node*
	%_P_b = alloca %struct.Node*
	store %struct.Node* %a, %struct.Node** %_P_a
	store %struct.Node* %b, %struct.Node** %_P_b
	%u0 = load %struct.Node*, %struct.Node** %_P_a
	%u1 = getelementptr %struct.Node, %struct.Node* %u0, i1 0, i32 0
	%u2 = load i32, i32* %u1
	%u3 = load %struct.Node*, %struct.Node** %_P_b
	%u4 = getelementptr %struct.Node, %struct.Node* %u3, i1 0, i32 0
	%u5 = load i32, i32* %u4
	%u6 = sub i32 %u2, %u5
	store i32 %u6, i32* %_retval_
	br label %bb0

bb0:
	%u7 = load i32, i32* %_retval_
	ret i32 %u7
}

define void @deathSort(%struct.Node* %head)
{

bb3:
	%_P_head = alloca %struct.Node*
	%swapped = alloca i32
	%swap = alloca i32
	%currNode = alloca %struct.Node*
	store %struct.Node* %head, %struct.Node** %_P_head
	store i32 1, i32* %swapped
	br label %bb4

bb4:
	%u8 = load i32, i32* %swapped
	%u9 = icmp eq i32 %u8, 1
	%u10 = zext i1 %u9 to i32
	%u45 = trunc i32 %u10 to i1
	br i1 %u45, label %bb5, label %bb12

bb5:
	store i32 0, i32* %swapped
	%u11 = load %struct.Node*, %struct.Node** %_P_head
	store %struct.Node* %u11, %struct.Node** %currNode
	br label %bb6

bb6:
	%u12 = load %struct.Node*, %struct.Node** %currNode
	%u13 = getelementptr %struct.Node, %struct.Node* %u12, i1 0, i32 2
	%u14 = load %struct.Node*, %struct.Node** %u13
	%u15 = load %struct.Node*, %struct.Node** %_P_head
	%u16 = icmp ne %struct.Node* %u14, %u15
	%u17 = zext i1 %u16 to i32
	%u44 = trunc i32 %u17 to i1
	br i1 %u44, label %bb7, label %bb11

bb7:
	%u18 = load %struct.Node*, %struct.Node** %currNode
	%u19 = load %struct.Node*, %struct.Node** %currNode
	%u20 = getelementptr %struct.Node, %struct.Node* %u19, i1 0, i32 2
	%u21 = load %struct.Node*, %struct.Node** %u20
	%u22 = call i32 @compare(%struct.Node* %u18, %struct.Node* %u21)
	%u23 = icmp sgt i32 %u22, 0
	%u24 = zext i1 %u23 to i32
	%u25 = trunc i32 %u24 to i1
	br i1 %u25, label %bb8, label %bb9

bb8:
	%u26 = load %struct.Node*, %struct.Node** %currNode
	%u27 = getelementptr %struct.Node, %struct.Node* %u26, i1 0, i32 0
	%u28 = load i32, i32* %u27
	store i32 %u28, i32* %swap
	%u29 = load %struct.Node*, %struct.Node** %currNode
	%u30 = getelementptr %struct.Node, %struct.Node* %u29, i1 0, i32 2
	%u31 = load %struct.Node*, %struct.Node** %u30
	%u32 = getelementptr %struct.Node, %struct.Node* %u31, i1 0, i32 0
	%u33 = load i32, i32* %u32
	%u34 = load %struct.Node*, %struct.Node** %currNode
	%u35 = getelementptr %struct.Node, %struct.Node* %u34, i1 0, i32 0
	store i32 %u33, i32* %u35
	%u36 = load i32, i32* %swap
	%u37 = load %struct.Node*, %struct.Node** %currNode
	%u38 = getelementptr %struct.Node, %struct.Node* %u37, i1 0, i32 2
	%u39 = load %struct.Node*, %struct.Node** %u38
	%u40 = getelementptr %struct.Node, %struct.Node* %u39, i1 0, i32 0
	store i32 %u36, i32* %u40
	store i32 1, i32* %swapped
	br label %bb10

bb9:
	br label %bb10

bb10:
	%u41 = load %struct.Node*, %struct.Node** %currNode
	%u42 = getelementptr %struct.Node, %struct.Node* %u41, i1 0, i32 2
	%u43 = load %struct.Node*, %struct.Node** %u42
	store %struct.Node* %u43, %struct.Node** %currNode
	br label %bb6

bb11:
	br label %bb4

bb12:
	br label %bb2

bb2:
	ret void
}

define void @printEVILList(%struct.Node* %head)
{

bb14:
	%_P_head = alloca %struct.Node*
	%currNode = alloca %struct.Node*
	%toFree = alloca %struct.Node*
	store %struct.Node* %head, %struct.Node** %_P_head
	%u46 = load %struct.Node*, %struct.Node** %_P_head
	%u47 = getelementptr %struct.Node, %struct.Node* %u46, i1 0, i32 2
	%u48 = load %struct.Node*, %struct.Node** %u47
	store %struct.Node* %u48, %struct.Node** %currNode
	%u49 = load %struct.Node*, %struct.Node** %_P_head
	%u50 = getelementptr %struct.Node, %struct.Node* %u49, i1 0, i32 0
	%u51 = load i32, i32* %u50
	%u52 = load %struct.Node*, %struct.Node** %_P_head
	%u53 = getelementptr %struct.Node, %struct.Node* %u52, i1 0, i32 0
	%u54 = load i32, i32* %u53
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u54)
	%u55 = load %struct.Node*, %struct.Node** %_P_head
	%u56 = bitcast %struct.Node* %u55 to i8*
	call void @free(i8* %u56)
	br label %bb15

bb15:
	%u57 = load %struct.Node*, %struct.Node** %currNode
	%u58 = load %struct.Node*, %struct.Node** %_P_head
	%u59 = icmp ne %struct.Node* %u57, %u58
	%u60 = zext i1 %u59 to i32
	%u73 = trunc i32 %u60 to i1
	br i1 %u73, label %bb16, label %bb17

bb16:
	%u61 = load %struct.Node*, %struct.Node** %currNode
	store %struct.Node* %u61, %struct.Node** %toFree
	%u62 = load %struct.Node*, %struct.Node** %currNode
	%u63 = getelementptr %struct.Node, %struct.Node* %u62, i1 0, i32 0
	%u64 = load i32, i32* %u63
	%u65 = load %struct.Node*, %struct.Node** %currNode
	%u66 = getelementptr %struct.Node, %struct.Node* %u65, i1 0, i32 0
	%u67 = load i32, i32* %u66
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u67)
	%u68 = load %struct.Node*, %struct.Node** %currNode
	%u69 = getelementptr %struct.Node, %struct.Node* %u68, i1 0, i32 2
	%u70 = load %struct.Node*, %struct.Node** %u69
	store %struct.Node* %u70, %struct.Node** %currNode
	%u71 = load %struct.Node*, %struct.Node** %toFree
	%u72 = bitcast %struct.Node* %u71 to i8*
	call void @free(i8* %u72)
	br label %bb15

bb17:
	br label %bb13

bb13:
	ret void
}

define i32 @main()
{

bb19:
	%_retval_ = alloca i32
	%numNodes = alloca i32
	%counter = alloca i32
	%currNode = alloca %struct.Node*
	%head = alloca %struct.Node*
	%previous = alloca %struct.Node*
	store i32 666, i32* @swapped
	%u74 = call i32 @read_helper()
	store i32 %u74, i32* %numNodes
	%u75 = load i32, i32* %numNodes
	%u76 = icmp sle i32 %u75, 0
	%u77 = zext i1 %u76 to i32
	%u78 = trunc i32 %u77 to i1
	br i1 %u78, label %bb20, label %bb21

bb20:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 -1)
	store i32 -1, i32* %_retval_
	br label %bb18

bb21:
	br label %bb22

bb22:
	%u79 = load i32, i32* %numNodes
	%u80 = mul i32 %u79, 1000
	store i32 %u80, i32* %numNodes
	%u81 = load i32, i32* %numNodes
	store i32 %u81, i32* %counter
	%u82 = call i8* @malloc_helper(i32 24)
	%u83 = bitcast i8* %u82 to %struct.Node*
	store %struct.Node* %u83, %struct.Node** %head
	%u84 = load i32, i32* %counter
	%u85 = load %struct.Node*, %struct.Node** %head
	%u86 = getelementptr %struct.Node, %struct.Node* %u85, i1 0, i32 0
	store i32 %u84, i32* %u86
	%u87 = load %struct.Node*, %struct.Node** %head
	%u88 = load %struct.Node*, %struct.Node** %head
	%u89 = getelementptr %struct.Node, %struct.Node* %u88, i1 0, i32 1
	store %struct.Node* %u87, %struct.Node** %u89
	%u90 = load %struct.Node*, %struct.Node** %head
	%u91 = load %struct.Node*, %struct.Node** %head
	%u92 = getelementptr %struct.Node, %struct.Node* %u91, i1 0, i32 2
	store %struct.Node* %u90, %struct.Node** %u92
	%u93 = load i32, i32* %counter
	%u94 = sub i32 %u93, 1
	store i32 %u94, i32* %counter
	%u95 = load %struct.Node*, %struct.Node** %head
	store %struct.Node* %u95, %struct.Node** %previous
	br label %bb23

bb23:
	%u96 = load i32, i32* %counter
	%u97 = icmp sgt i32 %u96, 0
	%u98 = zext i1 %u97 to i32
	%u116 = trunc i32 %u98 to i1
	br i1 %u116, label %bb24, label %bb25

bb24:
	%u99 = call i8* @malloc_helper(i32 24)
	%u100 = bitcast i8* %u99 to %struct.Node*
	store %struct.Node* %u100, %struct.Node** %currNode
	%u101 = load i32, i32* %counter
	%u102 = load %struct.Node*, %struct.Node** %currNode
	%u103 = getelementptr %struct.Node, %struct.Node* %u102, i1 0, i32 0
	store i32 %u101, i32* %u103
	%u104 = load %struct.Node*, %struct.Node** %previous
	%u105 = load %struct.Node*, %struct.Node** %currNode
	%u106 = getelementptr %struct.Node, %struct.Node* %u105, i1 0, i32 1
	store %struct.Node* %u104, %struct.Node** %u106
	%u107 = load %struct.Node*, %struct.Node** %head
	%u108 = load %struct.Node*, %struct.Node** %currNode
	%u109 = getelementptr %struct.Node, %struct.Node* %u108, i1 0, i32 2
	store %struct.Node* %u107, %struct.Node** %u109
	%u110 = load %struct.Node*, %struct.Node** %currNode
	%u111 = load %struct.Node*, %struct.Node** %previous
	%u112 = getelementptr %struct.Node, %struct.Node* %u111, i1 0, i32 2
	store %struct.Node* %u110, %struct.Node** %u112
	%u113 = load %struct.Node*, %struct.Node** %currNode
	store %struct.Node* %u113, %struct.Node** %previous
	%u114 = load i32, i32* %counter
	%u115 = sub i32 %u114, 1
	store i32 %u115, i32* %counter
	br label %bb23

bb25:
	%u117 = load %struct.Node*, %struct.Node** %head
	call void @deathSort(%struct.Node* %u117)
	%u118 = load %struct.Node*, %struct.Node** %head
	call void @printEVILList(%struct.Node* %u118)
	store i32 0, i32* %_retval_
	br label %bb18

bb18:
	%u119 = load i32, i32* %_retval_
	ret i32 %u119
}

declare i8* @malloc_helper(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @read_helper()
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1

