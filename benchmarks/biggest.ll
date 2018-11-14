target triple="i686"
%struct.IntList = type {i32, %struct.IntList*}


define %struct.IntList* @getIntList()
{

bb1:
	%_retval_ = alloca %struct.IntList*
	%list = alloca %struct.IntList*
	%next = alloca i32
	%u0 = call i8* @malloc_helper(i32 16)
	%u1 = bitcast i8* %u0 to %struct.IntList*
	store %struct.IntList* %u1, %struct.IntList** %list
	%u2 = call i32 @read_helper()
	store i32 %u2, i32* %next
	%u3 = load i32, i32* %next
	%u4 = icmp eq i32 %u3, -1
	%u5 = zext i1 %u4 to i32
	%u6 = trunc i32 %u5 to i1
	br i1 %u6, label %bb2, label %bb3

bb2:
	%u7 = load i32, i32* %next
	%u8 = load %struct.IntList*, %struct.IntList** %list
	%u9 = getelementptr %struct.IntList, %struct.IntList* %u8, i1 0, i32 0
	store i32 %u7, i32* %u9
	%u10 = load %struct.IntList*, %struct.IntList** %list
	%u11 = getelementptr %struct.IntList, %struct.IntList* %u10, i1 0, i32 1
	store %struct.IntList* null, %struct.IntList** %u11
	%u12 = load %struct.IntList*, %struct.IntList** %list
	store %struct.IntList* %u12, %struct.IntList** %_retval_
	br label %bb0

bb3:
	%u13 = load i32, i32* %next
	%u14 = load %struct.IntList*, %struct.IntList** %list
	%u15 = getelementptr %struct.IntList, %struct.IntList* %u14, i1 0, i32 0
	store i32 %u13, i32* %u15
	%u16 = call %struct.IntList* @getIntList()
	%u17 = load %struct.IntList*, %struct.IntList** %list
	%u18 = getelementptr %struct.IntList, %struct.IntList* %u17, i1 0, i32 1
	store %struct.IntList* %u16, %struct.IntList** %u18
	%u19 = load %struct.IntList*, %struct.IntList** %list
	store %struct.IntList* %u19, %struct.IntList** %_retval_
	br label %bb0

bb0:
	%u20 = load %struct.IntList*, %struct.IntList** %_retval_
	ret %struct.IntList* %u20
}

define i32 @biggest(i32 %num1, i32 %num2)
{

bb5:
	%_retval_ = alloca i32
	%_P_num1 = alloca i32
	%_P_num2 = alloca i32
	store i32 %num1, i32* %_P_num1
	store i32 %num2, i32* %_P_num2
	%u21 = load i32, i32* %_P_num1
	%u22 = load i32, i32* %_P_num2
	%u23 = icmp sgt i32 %u21, %u22
	%u24 = zext i1 %u23 to i32
	%u25 = trunc i32 %u24 to i1
	br i1 %u25, label %bb6, label %bb7

bb6:
	%u26 = load i32, i32* %_P_num1
	store i32 %u26, i32* %_retval_
	br label %bb4

bb7:
	%u27 = load i32, i32* %_P_num2
	store i32 %u27, i32* %_retval_
	br label %bb4

bb4:
	%u28 = load i32, i32* %_retval_
	ret i32 %u28
}

define i32 @biggestInList(%struct.IntList* %list)
{

bb9:
	%_retval_ = alloca i32
	%_P_list = alloca %struct.IntList*
	%big = alloca i32
	store %struct.IntList* %list, %struct.IntList** %_P_list
	%u29 = load %struct.IntList*, %struct.IntList** %_P_list
	%u30 = getelementptr %struct.IntList, %struct.IntList* %u29, i1 0, i32 0
	%u31 = load i32, i32* %u30
	store i32 %u31, i32* %big
	br label %bb10

bb10:
	%u32 = load %struct.IntList*, %struct.IntList** %_P_list
	%u33 = getelementptr %struct.IntList, %struct.IntList* %u32, i1 0, i32 1
	%u34 = load %struct.IntList*, %struct.IntList** %u33
	%u35 = icmp ne %struct.IntList* %u34, null
	%u36 = zext i1 %u35 to i32
	%u45 = trunc i32 %u36 to i1
	br i1 %u45, label %bb11, label %bb12

bb11:
	%u37 = load i32, i32* %big
	%u38 = load %struct.IntList*, %struct.IntList** %_P_list
	%u39 = getelementptr %struct.IntList, %struct.IntList* %u38, i1 0, i32 0
	%u40 = load i32, i32* %u39
	%u41 = call i32 @biggest(i32 %u37, i32 %u40)
	store i32 %u41, i32* %big
	%u42 = load %struct.IntList*, %struct.IntList** %_P_list
	%u43 = getelementptr %struct.IntList, %struct.IntList* %u42, i1 0, i32 1
	%u44 = load %struct.IntList*, %struct.IntList** %u43
	store %struct.IntList* %u44, %struct.IntList** %_P_list
	br label %bb10

bb12:
	%u46 = load i32, i32* %big
	store i32 %u46, i32* %_retval_
	br label %bb8

bb8:
	%u47 = load i32, i32* %_retval_
	ret i32 %u47
}

define i32 @main()
{

bb14:
	%_retval_ = alloca i32
	%list = alloca %struct.IntList*
	%u48 = call %struct.IntList* @getIntList()
	store %struct.IntList* %u48, %struct.IntList** %list
	%u49 = load %struct.IntList*, %struct.IntList** %list
	%u50 = call i32 @biggestInList(%struct.IntList* %u49)
	%u51 = load %struct.IntList*, %struct.IntList** %list
	%u52 = call i32 @biggestInList(%struct.IntList* %u51)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u52)
	store i32 0, i32* %_retval_
	br label %bb13

bb13:
	%u53 = load i32, i32* %_retval_
	ret i32 %u53
}

declare i8* @malloc_helper(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @read_helper()
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1

