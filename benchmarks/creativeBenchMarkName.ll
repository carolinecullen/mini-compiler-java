target triple="i686"
%struct.node = type {i32, %struct.node*}


define %struct.node* @buildList()
{

bb1:
	%_retval_ = alloca %struct.node*
	%input = alloca i32
	%i = alloca i32
	%n0 = alloca %struct.node*
	%n1 = alloca %struct.node*
	%n2 = alloca %struct.node*
	%n3 = alloca %struct.node*
	%n4 = alloca %struct.node*
	%n5 = alloca %struct.node*
	%u0 = call i8* @malloc_helper(i32 16)
	%u1 = bitcast i8* %u0 to %struct.node*
	store %struct.node* %u1, %struct.node** %n0
	%u2 = call i8* @malloc_helper(i32 16)
	%u3 = bitcast i8* %u2 to %struct.node*
	store %struct.node* %u3, %struct.node** %n1
	%u4 = call i8* @malloc_helper(i32 16)
	%u5 = bitcast i8* %u4 to %struct.node*
	store %struct.node* %u5, %struct.node** %n2
	%u6 = call i8* @malloc_helper(i32 16)
	%u7 = bitcast i8* %u6 to %struct.node*
	store %struct.node* %u7, %struct.node** %n3
	%u8 = call i8* @malloc_helper(i32 16)
	%u9 = bitcast i8* %u8 to %struct.node*
	store %struct.node* %u9, %struct.node** %n4
	%u10 = call i8* @malloc_helper(i32 16)
	%u11 = bitcast i8* %u10 to %struct.node*
	store %struct.node* %u11, %struct.node** %n5
	%u12 = call i32 @read_helper()
	%u13 = load %struct.node*, %struct.node** %n0
	%u14 = getelementptr %struct.node, %struct.node* %u13, i1 0, i32 0
	store i32 %u12, i32* %u14
	%u15 = call i32 @read_helper()
	%u16 = load %struct.node*, %struct.node** %n1
	%u17 = getelementptr %struct.node, %struct.node* %u16, i1 0, i32 0
	store i32 %u15, i32* %u17
	%u18 = call i32 @read_helper()
	%u19 = load %struct.node*, %struct.node** %n2
	%u20 = getelementptr %struct.node, %struct.node* %u19, i1 0, i32 0
	store i32 %u18, i32* %u20
	%u21 = call i32 @read_helper()
	%u22 = load %struct.node*, %struct.node** %n3
	%u23 = getelementptr %struct.node, %struct.node* %u22, i1 0, i32 0
	store i32 %u21, i32* %u23
	%u24 = call i32 @read_helper()
	%u25 = load %struct.node*, %struct.node** %n4
	%u26 = getelementptr %struct.node, %struct.node* %u25, i1 0, i32 0
	store i32 %u24, i32* %u26
	%u27 = call i32 @read_helper()
	%u28 = load %struct.node*, %struct.node** %n5
	%u29 = getelementptr %struct.node, %struct.node* %u28, i1 0, i32 0
	store i32 %u27, i32* %u29
	%u30 = load %struct.node*, %struct.node** %n1
	%u31 = load %struct.node*, %struct.node** %n0
	%u32 = getelementptr %struct.node, %struct.node* %u31, i1 0, i32 1
	store %struct.node* %u30, %struct.node** %u32
	%u33 = load %struct.node*, %struct.node** %n2
	%u34 = load %struct.node*, %struct.node** %n1
	%u35 = getelementptr %struct.node, %struct.node* %u34, i1 0, i32 1
	store %struct.node* %u33, %struct.node** %u35
	%u36 = load %struct.node*, %struct.node** %n3
	%u37 = load %struct.node*, %struct.node** %n2
	%u38 = getelementptr %struct.node, %struct.node* %u37, i1 0, i32 1
	store %struct.node* %u36, %struct.node** %u38
	%u39 = load %struct.node*, %struct.node** %n4
	%u40 = load %struct.node*, %struct.node** %n3
	%u41 = getelementptr %struct.node, %struct.node* %u40, i1 0, i32 1
	store %struct.node* %u39, %struct.node** %u41
	%u42 = load %struct.node*, %struct.node** %n5
	%u43 = load %struct.node*, %struct.node** %n4
	%u44 = getelementptr %struct.node, %struct.node* %u43, i1 0, i32 1
	store %struct.node* %u42, %struct.node** %u44
	%u45 = load %struct.node*, %struct.node** %n5
	%u46 = getelementptr %struct.node, %struct.node* %u45, i1 0, i32 1
	store %struct.node* null, %struct.node** %u46
	%u47 = load %struct.node*, %struct.node** %n0
	store %struct.node* %u47, %struct.node** %_retval_
	br label %bb0

bb0:
	%u48 = load %struct.node*, %struct.node** %_retval_
	ret %struct.node* %u48
}

define i32 @multiple(%struct.node* %list)
{

bb3:
	%_retval_ = alloca i32
	%_P_list = alloca %struct.node*
	%i = alloca i32
	%product = alloca i32
	%cur = alloca %struct.node*
	store %struct.node* %list, %struct.node** %_P_list
	store i32 0, i32* %i
	%u49 = load %struct.node*, %struct.node** %_P_list
	store %struct.node* %u49, %struct.node** %cur
	%u50 = load %struct.node*, %struct.node** %cur
	%u51 = getelementptr %struct.node, %struct.node* %u50, i1 0, i32 0
	%u52 = load i32, i32* %u51
	store i32 %u52, i32* %product
	%u53 = load %struct.node*, %struct.node** %cur
	%u54 = getelementptr %struct.node, %struct.node* %u53, i1 0, i32 1
	%u55 = load %struct.node*, %struct.node** %u54
	store %struct.node* %u55, %struct.node** %cur
	br label %bb4

bb4:
	%u56 = load i32, i32* %i
	%u57 = icmp slt i32 %u56, 5
	%u58 = zext i1 %u57 to i32
	%u71 = trunc i32 %u58 to i1
	br i1 %u71, label %bb5, label %bb6

bb5:
	%u59 = load i32, i32* %product
	%u60 = load %struct.node*, %struct.node** %cur
	%u61 = getelementptr %struct.node, %struct.node* %u60, i1 0, i32 0
	%u62 = load i32, i32* %u61
	%u63 = mul i32 %u59, %u62
	store i32 %u63, i32* %product
	%u64 = load %struct.node*, %struct.node** %cur
	%u65 = getelementptr %struct.node, %struct.node* %u64, i1 0, i32 1
	%u66 = load %struct.node*, %struct.node** %u65
	store %struct.node* %u66, %struct.node** %cur
	%u67 = load i32, i32* %product
	%u68 = load i32, i32* %product
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u68)
	%u69 = load i32, i32* %i
	%u70 = add i32 %u69, 1
	store i32 %u70, i32* %i
	br label %bb4

bb6:
	%u72 = load i32, i32* %product
	store i32 %u72, i32* %_retval_
	br label %bb2

bb2:
	%u73 = load i32, i32* %_retval_
	ret i32 %u73
}

define i32 @add(%struct.node* %list)
{

bb8:
	%_retval_ = alloca i32
	%_P_list = alloca %struct.node*
	%i = alloca i32
	%sum = alloca i32
	%cur = alloca %struct.node*
	store %struct.node* %list, %struct.node** %_P_list
	store i32 0, i32* %i
	%u74 = load %struct.node*, %struct.node** %_P_list
	store %struct.node* %u74, %struct.node** %cur
	%u75 = load %struct.node*, %struct.node** %cur
	%u76 = getelementptr %struct.node, %struct.node* %u75, i1 0, i32 0
	%u77 = load i32, i32* %u76
	store i32 %u77, i32* %sum
	%u78 = load %struct.node*, %struct.node** %cur
	%u79 = getelementptr %struct.node, %struct.node* %u78, i1 0, i32 1
	%u80 = load %struct.node*, %struct.node** %u79
	store %struct.node* %u80, %struct.node** %cur
	br label %bb9

bb9:
	%u81 = load i32, i32* %i
	%u82 = icmp slt i32 %u81, 5
	%u83 = zext i1 %u82 to i32
	%u96 = trunc i32 %u83 to i1
	br i1 %u96, label %bb10, label %bb11

bb10:
	%u84 = load i32, i32* %sum
	%u85 = load %struct.node*, %struct.node** %cur
	%u86 = getelementptr %struct.node, %struct.node* %u85, i1 0, i32 0
	%u87 = load i32, i32* %u86
	%u88 = add i32 %u84, %u87
	store i32 %u88, i32* %sum
	%u89 = load %struct.node*, %struct.node** %cur
	%u90 = getelementptr %struct.node, %struct.node* %u89, i1 0, i32 1
	%u91 = load %struct.node*, %struct.node** %u90
	store %struct.node* %u91, %struct.node** %cur
	%u92 = load i32, i32* %sum
	%u93 = load i32, i32* %sum
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u93)
	%u94 = load i32, i32* %i
	%u95 = add i32 %u94, 1
	store i32 %u95, i32* %i
	br label %bb9

bb11:
	%u97 = load i32, i32* %sum
	store i32 %u97, i32* %_retval_
	br label %bb7

bb7:
	%u98 = load i32, i32* %_retval_
	ret i32 %u98
}

define i32 @recurseList(%struct.node* %list)
{

bb13:
	%_retval_ = alloca i32
	%_P_list = alloca %struct.node*
	store %struct.node* %list, %struct.node** %_P_list
	%u99 = load %struct.node*, %struct.node** %_P_list
	%u100 = getelementptr %struct.node, %struct.node* %u99, i1 0, i32 1
	%u101 = load %struct.node*, %struct.node** %u100
	%u102 = icmp eq %struct.node* %u101, null
	%u103 = zext i1 %u102 to i32
	%u104 = trunc i32 %u103 to i1
	br i1 %u104, label %bb14, label %bb15

bb14:
	%u105 = load %struct.node*, %struct.node** %_P_list
	%u106 = getelementptr %struct.node, %struct.node* %u105, i1 0, i32 0
	%u107 = load i32, i32* %u106
	store i32 %u107, i32* %_retval_
	br label %bb12

bb15:
	%u108 = load %struct.node*, %struct.node** %_P_list
	%u109 = getelementptr %struct.node, %struct.node* %u108, i1 0, i32 0
	%u110 = load i32, i32* %u109
	%u111 = load %struct.node*, %struct.node** %_P_list
	%u112 = getelementptr %struct.node, %struct.node* %u111, i1 0, i32 1
	%u113 = load %struct.node*, %struct.node** %u112
	%u114 = call i32 @recurseList(%struct.node* %u113)
	%u115 = mul i32 %u110, %u114
	store i32 %u115, i32* %_retval_
	br label %bb12

bb12:
	%u116 = load i32, i32* %_retval_
	ret i32 %u116
}

define i32 @main()
{

bb17:
	%_retval_ = alloca i32
	%list = alloca %struct.node*
	%product = alloca i32
	%sum = alloca i32
	%result = alloca i32
	%bigProduct = alloca i32
	%i = alloca i32
	store i32 0, i32* %i
	store i32 0, i32* %bigProduct
	%u117 = call %struct.node* @buildList()
	store %struct.node* %u117, %struct.node** %list
	%u118 = load %struct.node*, %struct.node** %list
	%u119 = call i32 @multiple(%struct.node* %u118)
	store i32 %u119, i32* %product
	%u120 = load %struct.node*, %struct.node** %list
	%u121 = call i32 @add(%struct.node* %u120)
	store i32 %u121, i32* %sum
	%u122 = load i32, i32* %product
	%u123 = load i32, i32* %sum
	%u124 = sdiv i32 %u123, 2
	%u125 = sub i32 %u122, %u124
	store i32 %u125, i32* %result
	br label %bb18

bb18:
	%u126 = load i32, i32* %i
	%u127 = icmp slt i32 %u126, 2
	%u128 = zext i1 %u127 to i32
	%u135 = trunc i32 %u128 to i1
	br i1 %u135, label %bb19, label %bb20

bb19:
	%u129 = load i32, i32* %bigProduct
	%u130 = load %struct.node*, %struct.node** %list
	%u131 = call i32 @recurseList(%struct.node* %u130)
	%u132 = add i32 %u129, %u131
	store i32 %u132, i32* %bigProduct
	%u133 = load i32, i32* %i
	%u134 = add i32 %u133, 1
	store i32 %u134, i32* %i
	br label %bb18

bb20:
	%u136 = load i32, i32* %bigProduct
	%u137 = load i32, i32* %bigProduct
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u137)
	br label %bb21

bb21:
	%u138 = load i32, i32* %bigProduct
	%u139 = icmp ne i32 %u138, 0
	%u140 = zext i1 %u139 to i32
	%u143 = trunc i32 %u140 to i1
	br i1 %u143, label %bb22, label %bb23

bb22:
	%u141 = load i32, i32* %bigProduct
	%u142 = sub i32 %u141, 1
	store i32 %u142, i32* %bigProduct
	br label %bb21

bb23:
	%u144 = load i32, i32* %result
	%u145 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u145)
	%u146 = load i32, i32* %bigProduct
	%u147 = load i32, i32* %bigProduct
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u147)
	store i32 0, i32* %_retval_
	br label %bb16

bb16:
	%u148 = load i32, i32* %_retval_
	ret i32 %u148
}

declare i8* @malloc_helper(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @read_helper()
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1

