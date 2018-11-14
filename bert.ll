target triple="i686"
%struct.tnode = type {i32, %struct.tnode*, %struct.tnode*}
%struct.node = type {i32, %struct.node*}
%struct.myCopy = type {i32}
%struct.i = type {i32}

@a = common global i32 0, align 8
@b = common global i32 0, align 8
@i = common global %struct.i* null, align 8

define %struct.node* @concatLists(%struct.node* %first, %struct.node* %second)
{

bb1:
	%_retval_ = alloca %struct.node*
	%_P_first = alloca %struct.node*
	%_P_second = alloca %struct.node*
	%temp = alloca %struct.node*
	store %struct.node* %first, %struct.node** %_P_first
	store %struct.node* %second, %struct.node** %_P_second
	%u0 = load %struct.node*, %struct.node** %_P_first
	store %struct.node* %u0, %struct.node** %temp
	%u1 = load %struct.node*, %struct.node** %_P_first
	%u2 = icmp eq %struct.node* %u1, null
	%u3 = zext i1 %u2 to i32
	%u4 = trunc i32 %u3 to i1
	br i1 %u4, label %bb2, label %bb3

bb2:
	%u5 = load %struct.node*, %struct.node** %_P_second
	store %struct.node* %u5, %struct.node** %_retval_
	br label %bb0

bb3:
	br label %bb4

bb4:
	br label %bb5

bb5:
	%u6 = load %struct.node*, %struct.node** %temp
	%u7 = getelementptr %struct.node, %struct.node* %u6, i1 0, i32 1
	%u8 = load %struct.node*, %struct.node** %u7
	%u9 = icmp ne %struct.node* %u8, null
	%u10 = zext i1 %u9 to i32
	%u14 = trunc i32 %u10 to i1
	br i1 %u14, label %bb6, label %bb7

bb6:
	%u11 = load %struct.node*, %struct.node** %temp
	%u12 = getelementptr %struct.node, %struct.node* %u11, i1 0, i32 1
	%u13 = load %struct.node*, %struct.node** %u12
	store %struct.node* %u13, %struct.node** %temp
	br label %bb5

bb7:
	%u15 = load %struct.node*, %struct.node** %_P_second
	%u16 = load %struct.node*, %struct.node** %temp
	%u17 = getelementptr %struct.node, %struct.node* %u16, i1 0, i32 1
	store %struct.node* %u15, %struct.node** %u17
	%u18 = load %struct.node*, %struct.node** %_P_first
	store %struct.node* %u18, %struct.node** %_retval_
	br label %bb0

bb0:
	%u19 = load %struct.node*, %struct.node** %_retval_
	ret %struct.node* %u19
}

define %struct.node* @add(%struct.node* %list, i32 %toAdd)
{

bb9:
	%_retval_ = alloca %struct.node*
	%_P_list = alloca %struct.node*
	%_P_toAdd = alloca i32
	%newNode = alloca %struct.node*
	store %struct.node* %list, %struct.node** %_P_list
	store i32 %toAdd, i32* %_P_toAdd
	%u20 = call i8* @malloc_helper(i32 16)
	%u21 = bitcast i8* %u20 to %struct.node*
	store %struct.node* %u21, %struct.node** %newNode
	%u22 = load i32, i32* %_P_toAdd
	%u23 = load %struct.node*, %struct.node** %newNode
	%u24 = getelementptr %struct.node, %struct.node* %u23, i1 0, i32 0
	store i32 %u22, i32* %u24
	%u25 = load %struct.node*, %struct.node** %_P_list
	%u26 = load %struct.node*, %struct.node** %newNode
	%u27 = getelementptr %struct.node, %struct.node* %u26, i1 0, i32 1
	store %struct.node* %u25, %struct.node** %u27
	%u28 = load %struct.node*, %struct.node** %newNode
	store %struct.node* %u28, %struct.node** %_retval_
	br label %bb8

bb8:
	%u29 = load %struct.node*, %struct.node** %_retval_
	ret %struct.node* %u29
}

define %struct.node* @myCopy(%struct.node* %src)
{

bb11:
	%_retval_ = alloca %struct.node*
	%_P_src = alloca %struct.node*
	store %struct.node* %src, %struct.node** %_P_src
	%u30 = load %struct.node*, %struct.node** %_P_src
	%u31 = icmp eq %struct.node* %u30, null
	%u32 = zext i1 %u31 to i32
	%u33 = trunc i32 %u32 to i1
	br i1 %u33, label %bb12, label %bb13

bb12:
	store %struct.node* null, %struct.node** %_retval_
	br label %bb10

bb13:
	br label %bb14

bb14:
	%u34 = load %struct.node*, %struct.node** %_P_src
	%u35 = getelementptr %struct.node, %struct.node* %u34, i1 0, i32 0
	%u36 = load i32, i32* %u35
	%u37 = call %struct.node* @add(%struct.node* null, i32 %u36)
	%u38 = load %struct.node*, %struct.node** %_P_src
	%u39 = getelementptr %struct.node, %struct.node* %u38, i1 0, i32 1
	%u40 = load %struct.node*, %struct.node** %u39
	%u41 = call %struct.node* @myCopy(%struct.node* %u40)
	%u42 = call %struct.node* @concatLists(%struct.node* %u37, %struct.node* %u41)
	store %struct.node* %u42, %struct.node** %_retval_
	br label %bb10

bb10:
	%u43 = load %struct.node*, %struct.node** %_retval_
	ret %struct.node* %u43
}

define i32 @main()
{

bb16:
	%_retval_ = alloca i32
	%i = alloca i32
	%element = alloca i32
	%myList = alloca %struct.node*
	%copyList1 = alloca %struct.node*
	%copyList2 = alloca %struct.node*
	%sortedList = alloca %struct.node*
	store %struct.node* null, %struct.node** %myList
	store %struct.node* null, %struct.node** %copyList1
	store %struct.node* null, %struct.node** %copyList2
	store i32 0, i32* %i
	br label %bb17

bb17:
	%u44 = load i32, i32* %i
	%u45 = icmp slt i32 %u44, 10
	%u46 = zext i1 %u45 to i32
	%u57 = trunc i32 %u46 to i1
	br i1 %u57, label %bb18, label %bb19

bb18:
	%u47 = call i32 @read_helper()
	store i32 %u47, i32* %element
	%u48 = load %struct.node*, %struct.node** %myList
	%u49 = load i32, i32* %element
	%u50 = call %struct.node* @add(%struct.node* %u48, i32 %u49)
	store %struct.node* %u50, %struct.node** %myList
	%u51 = load %struct.node*, %struct.node** %myList
	%u52 = call %struct.node* @myCopy(%struct.node* %u51)
	store %struct.node* %u52, %struct.node** %copyList1
	%u53 = load %struct.node*, %struct.node** %myList
	%u54 = call %struct.node* @myCopy(%struct.node* %u53)
	store %struct.node* %u54, %struct.node** %copyList2
	%u55 = load i32, i32* %i
	%u56 = add i32 %u55, 1
	store i32 %u56, i32* %i
	br label %bb17

bb19:
	store i32 0, i32* %_retval_
	br label %bb15

bb15:
	%u58 = load i32, i32* %_retval_
	ret i32 %u58
}

declare i8* @malloc_helper(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @read_helper()
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1

