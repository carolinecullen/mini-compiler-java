target triple="i686"
%struct.intList = type {i32, %struct.intList*}

@intList = common global i32 0, align 8

define i32 @length(%struct.intList* %list)
{

bb1:
	%_retval_ = alloca i32
	%_P_list = alloca %struct.intList*
	store %struct.intList* %list, %struct.intList** %_P_list
	%u0 = load %struct.intList*, %struct.intList** %_P_list
	%u1 = icmp eq %struct.intList* %u0, null
	%u2 = zext i1 %u1 to i32
	%u3 = trunc i32 %u2 to i1
	br i1 %u3, label %bb2, label %bb3

bb2:
	store i32 0, i32* %_retval_
	br label %bb0

bb3:
	br label %bb4

bb4:
	%u4 = load %struct.intList*, %struct.intList** %_P_list
	%u5 = getelementptr %struct.intList, %struct.intList* %u4, i1 0, i32 1
	%u6 = load %struct.intList*, %struct.intList** %u5
	%u7 = call i32 @length(%struct.intList* %u6)
	%u8 = add i32 1, %u7
	store i32 %u8, i32* %_retval_
	br label %bb0

bb0:
	%u9 = load i32, i32* %_retval_
	ret i32 %u9
}

define %struct.intList* @addToFront(%struct.intList* %list, i32 %element)
{

bb6:
	%_retval_ = alloca %struct.intList*
	%_P_list = alloca %struct.intList*
	%_P_element = alloca i32
	%front = alloca %struct.intList*
	store %struct.intList* %list, %struct.intList** %_P_list
	store i32 %element, i32* %_P_element
	%u10 = load %struct.intList*, %struct.intList** %_P_list
	%u11 = icmp eq %struct.intList* %u10, null
	%u12 = zext i1 %u11 to i32
	%u13 = trunc i32 %u12 to i1
	br i1 %u13, label %bb7, label %bb8

bb7:
	%u14 = call i8* @malloc_helper(i32 16)
	%u15 = bitcast i8* %u14 to %struct.intList*
	store %struct.intList* %u15, %struct.intList** %_P_list
	%u16 = load i32, i32* %_P_element
	%u17 = load %struct.intList*, %struct.intList** %_P_list
	%u18 = getelementptr %struct.intList, %struct.intList* %u17, i1 0, i32 0
	store i32 %u16, i32* %u18
	%u19 = load %struct.intList*, %struct.intList** %_P_list
	%u20 = getelementptr %struct.intList, %struct.intList* %u19, i1 0, i32 1
	store %struct.intList* null, %struct.intList** %u20
	%u21 = load %struct.intList*, %struct.intList** %_P_list
	store %struct.intList* %u21, %struct.intList** %_retval_
	br label %bb5

bb8:
	br label %bb9

bb9:
	%u22 = call i8* @malloc_helper(i32 16)
	%u23 = bitcast i8* %u22 to %struct.intList*
	store %struct.intList* %u23, %struct.intList** %front
	%u24 = load i32, i32* %_P_element
	%u25 = load %struct.intList*, %struct.intList** %front
	%u26 = getelementptr %struct.intList, %struct.intList* %u25, i1 0, i32 0
	store i32 %u24, i32* %u26
	%u27 = load %struct.intList*, %struct.intList** %_P_list
	%u28 = load %struct.intList*, %struct.intList** %front
	%u29 = getelementptr %struct.intList, %struct.intList* %u28, i1 0, i32 1
	store %struct.intList* %u27, %struct.intList** %u29
	%u30 = load %struct.intList*, %struct.intList** %front
	store %struct.intList* %u30, %struct.intList** %_retval_
	br label %bb5

bb5:
	%u31 = load %struct.intList*, %struct.intList** %_retval_
	ret %struct.intList* %u31
}

define %struct.intList* @deleteFirst(%struct.intList* %list)
{

bb11:
	%_retval_ = alloca %struct.intList*
	%_P_list = alloca %struct.intList*
	%first = alloca %struct.intList*
	store %struct.intList* %list, %struct.intList** %_P_list
	%u32 = load %struct.intList*, %struct.intList** %_P_list
	%u33 = icmp eq %struct.intList* %u32, null
	%u34 = zext i1 %u33 to i32
	%u35 = trunc i32 %u34 to i1
	br i1 %u35, label %bb12, label %bb13

bb12:
	store %struct.intList* null, %struct.intList** %_retval_
	br label %bb10

bb13:
	br label %bb14

bb14:
	%u36 = load %struct.intList*, %struct.intList** %_P_list
	store %struct.intList* %u36, %struct.intList** %first
	%u37 = load %struct.intList*, %struct.intList** %_P_list
	%u38 = getelementptr %struct.intList, %struct.intList* %u37, i1 0, i32 1
	%u39 = load %struct.intList*, %struct.intList** %u38
	store %struct.intList* %u39, %struct.intList** %_P_list
	%u40 = load %struct.intList*, %struct.intList** %first
	%u41 = bitcast %struct.intList* %u40 to i8*
	call void @free(i8* %u41)
	%u42 = load %struct.intList*, %struct.intList** %_P_list
	store %struct.intList* %u42, %struct.intList** %_retval_
	br label %bb10

bb10:
	%u43 = load %struct.intList*, %struct.intList** %_retval_
	ret %struct.intList* %u43
}

define i32 @main()
{

bb16:
	%_retval_ = alloca i32
	%list = alloca %struct.intList*
	%sum = alloca i32
	%u44 = call i32 @read_helper()
	store i32 %u44, i32* @intList
	store i32 0, i32* %sum
	store %struct.intList* null, %struct.intList** %list
	br label %bb17

bb17:
	%u45 = load i32, i32* @intList
	%u46 = icmp sgt i32 %u45, 0
	%u47 = zext i1 %u46 to i32
	%u59 = trunc i32 %u47 to i1
	br i1 %u59, label %bb18, label %bb19

bb18:
	%u48 = load %struct.intList*, %struct.intList** %list
	%u49 = load i32, i32* @intList
	%u50 = call %struct.intList* @addToFront(%struct.intList* %u48, i32 %u49)
	store %struct.intList* %u50, %struct.intList** %list
	%u51 = load %struct.intList*, %struct.intList** %list
	%u52 = getelementptr %struct.intList, %struct.intList* %u51, i1 0, i32 0
	%u53 = load i32, i32* %u52
	%u54 = load %struct.intList*, %struct.intList** %list
	%u55 = getelementptr %struct.intList, %struct.intList* %u54, i1 0, i32 0
	%u56 = load i32, i32* %u55
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %u56)
	%u57 = load i32, i32* @intList
	%u58 = sub i32 %u57, 1
	store i32 %u58, i32* @intList
	br label %bb17

bb19:
	%u60 = load %struct.intList*, %struct.intList** %list
	%u61 = call i32 @length(%struct.intList* %u60)
	%u62 = load %struct.intList*, %struct.intList** %list
	%u63 = call i32 @length(%struct.intList* %u62)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %u63)
	br label %bb20

bb20:
	%u64 = load %struct.intList*, %struct.intList** %list
	%u65 = call i32 @length(%struct.intList* %u64)
	%u66 = icmp sgt i32 %u65, 0
	%u67 = zext i1 %u66 to i32
	%u79 = trunc i32 %u67 to i1
	br i1 %u79, label %bb21, label %bb22

bb21:
	%u68 = load i32, i32* %sum
	%u69 = load %struct.intList*, %struct.intList** %list
	%u70 = getelementptr %struct.intList, %struct.intList* %u69, i1 0, i32 0
	%u71 = load i32, i32* %u70
	%u72 = add i32 %u68, %u71
	store i32 %u72, i32* %sum
	%u73 = load %struct.intList*, %struct.intList** %list
	%u74 = call i32 @length(%struct.intList* %u73)
	%u75 = load %struct.intList*, %struct.intList** %list
	%u76 = call i32 @length(%struct.intList* %u75)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %u76)
	%u77 = load %struct.intList*, %struct.intList** %list
	%u78 = call %struct.intList* @deleteFirst(%struct.intList* %u77)
	store %struct.intList* %u78, %struct.intList** %list
	br label %bb20

bb22:
	%u80 = load i32, i32* %sum
	%u81 = load i32, i32* %sum
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u81)
	store i32 0, i32* %_retval_
	br label %bb15

bb15:
	%u82 = load i32, i32* %_retval_
	ret i32 %u82
}

declare i8* @malloc_helper(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @read_helper()
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1

