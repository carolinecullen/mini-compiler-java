target triple="i686"
%struct.gameBoard = type {i32, i32, i32, i32, i32, i32, i32, i32, i32}


define void @cleanBoard(%struct.gameBoard* %board)
{

bb1:
	%_P_board = alloca %struct.gameBoard*
	store %struct.gameBoard* %board, %struct.gameBoard** %_P_board
	%u0 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u1 = getelementptr %struct.gameBoard, %struct.gameBoard* %u0, i1 0, i32 0
	store i32 0, i32* %u1
	%u2 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u3 = getelementptr %struct.gameBoard, %struct.gameBoard* %u2, i1 0, i32 1
	store i32 0, i32* %u3
	%u4 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u5 = getelementptr %struct.gameBoard, %struct.gameBoard* %u4, i1 0, i32 2
	store i32 0, i32* %u5
	%u6 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u7 = getelementptr %struct.gameBoard, %struct.gameBoard* %u6, i1 0, i32 3
	store i32 0, i32* %u7
	%u8 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u9 = getelementptr %struct.gameBoard, %struct.gameBoard* %u8, i1 0, i32 4
	store i32 0, i32* %u9
	%u10 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u11 = getelementptr %struct.gameBoard, %struct.gameBoard* %u10, i1 0, i32 5
	store i32 0, i32* %u11
	%u12 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u13 = getelementptr %struct.gameBoard, %struct.gameBoard* %u12, i1 0, i32 6
	store i32 0, i32* %u13
	%u14 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u15 = getelementptr %struct.gameBoard, %struct.gameBoard* %u14, i1 0, i32 7
	store i32 0, i32* %u15
	%u16 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u17 = getelementptr %struct.gameBoard, %struct.gameBoard* %u16, i1 0, i32 8
	store i32 0, i32* %u17
	br label %bb0

bb0:
	ret void
}

define void @printBoard(%struct.gameBoard* %board)
{

bb3:
	%_P_board = alloca %struct.gameBoard*
	store %struct.gameBoard* %board, %struct.gameBoard** %_P_board
	%u18 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u19 = getelementptr %struct.gameBoard, %struct.gameBoard* %u18, i1 0, i32 0
	%u20 = load i32, i32* %u19
	%u21 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u22 = getelementptr %struct.gameBoard, %struct.gameBoard* %u21, i1 0, i32 0
	%u23 = load i32, i32* %u22
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %u23)
	%u24 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u25 = getelementptr %struct.gameBoard, %struct.gameBoard* %u24, i1 0, i32 1
	%u26 = load i32, i32* %u25
	%u27 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u28 = getelementptr %struct.gameBoard, %struct.gameBoard* %u27, i1 0, i32 1
	%u29 = load i32, i32* %u28
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %u29)
	%u30 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u31 = getelementptr %struct.gameBoard, %struct.gameBoard* %u30, i1 0, i32 2
	%u32 = load i32, i32* %u31
	%u33 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u34 = getelementptr %struct.gameBoard, %struct.gameBoard* %u33, i1 0, i32 2
	%u35 = load i32, i32* %u34
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u35)
	%u36 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u37 = getelementptr %struct.gameBoard, %struct.gameBoard* %u36, i1 0, i32 3
	%u38 = load i32, i32* %u37
	%u39 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u40 = getelementptr %struct.gameBoard, %struct.gameBoard* %u39, i1 0, i32 3
	%u41 = load i32, i32* %u40
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %u41)
	%u42 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u43 = getelementptr %struct.gameBoard, %struct.gameBoard* %u42, i1 0, i32 4
	%u44 = load i32, i32* %u43
	%u45 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u46 = getelementptr %struct.gameBoard, %struct.gameBoard* %u45, i1 0, i32 4
	%u47 = load i32, i32* %u46
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %u47)
	%u48 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u49 = getelementptr %struct.gameBoard, %struct.gameBoard* %u48, i1 0, i32 5
	%u50 = load i32, i32* %u49
	%u51 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u52 = getelementptr %struct.gameBoard, %struct.gameBoard* %u51, i1 0, i32 5
	%u53 = load i32, i32* %u52
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u53)
	%u54 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u55 = getelementptr %struct.gameBoard, %struct.gameBoard* %u54, i1 0, i32 6
	%u56 = load i32, i32* %u55
	%u57 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u58 = getelementptr %struct.gameBoard, %struct.gameBoard* %u57, i1 0, i32 6
	%u59 = load i32, i32* %u58
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %u59)
	%u60 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u61 = getelementptr %struct.gameBoard, %struct.gameBoard* %u60, i1 0, i32 7
	%u62 = load i32, i32* %u61
	%u63 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u64 = getelementptr %struct.gameBoard, %struct.gameBoard* %u63, i1 0, i32 7
	%u65 = load i32, i32* %u64
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %u65)
	%u66 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u67 = getelementptr %struct.gameBoard, %struct.gameBoard* %u66, i1 0, i32 8
	%u68 = load i32, i32* %u67
	%u69 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u70 = getelementptr %struct.gameBoard, %struct.gameBoard* %u69, i1 0, i32 8
	%u71 = load i32, i32* %u70
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u71)
	br label %bb2

bb2:
	ret void
}

define void @printMoveBoard()
{

bb5:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 123)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 456)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 789)
	br label %bb4

bb4:
	ret void
}

define void @placePiece(%struct.gameBoard* %board, i32 %turn, i32 %placement)
{

bb7:
	%_P_board = alloca %struct.gameBoard*
	%_P_turn = alloca i32
	%_P_placement = alloca i32
	store %struct.gameBoard* %board, %struct.gameBoard** %_P_board
	store i32 %turn, i32* %_P_turn
	store i32 %placement, i32* %_P_placement
	%u72 = load i32, i32* %_P_placement
	%u73 = icmp eq i32 %u72, 1
	%u74 = zext i1 %u73 to i32
	%u75 = trunc i32 %u74 to i1
	br i1 %u75, label %bb8, label %bb9

bb8:
	%u76 = load i32, i32* %_P_turn
	%u77 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u78 = getelementptr %struct.gameBoard, %struct.gameBoard* %u77, i1 0, i32 0
	store i32 %u76, i32* %u78
	br label %bb34

bb9:
	%u79 = load i32, i32* %_P_placement
	%u80 = icmp eq i32 %u79, 2
	%u81 = zext i1 %u80 to i32
	%u82 = trunc i32 %u81 to i1
	br i1 %u82, label %bb10, label %bb11

bb10:
	%u83 = load i32, i32* %_P_turn
	%u84 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u85 = getelementptr %struct.gameBoard, %struct.gameBoard* %u84, i1 0, i32 1
	store i32 %u83, i32* %u85
	br label %bb33

bb11:
	%u86 = load i32, i32* %_P_placement
	%u87 = icmp eq i32 %u86, 3
	%u88 = zext i1 %u87 to i32
	%u89 = trunc i32 %u88 to i1
	br i1 %u89, label %bb12, label %bb13

bb12:
	%u90 = load i32, i32* %_P_turn
	%u91 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u92 = getelementptr %struct.gameBoard, %struct.gameBoard* %u91, i1 0, i32 2
	store i32 %u90, i32* %u92
	br label %bb32

bb13:
	%u93 = load i32, i32* %_P_placement
	%u94 = icmp eq i32 %u93, 4
	%u95 = zext i1 %u94 to i32
	%u96 = trunc i32 %u95 to i1
	br i1 %u96, label %bb14, label %bb15

bb14:
	%u97 = load i32, i32* %_P_turn
	%u98 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u99 = getelementptr %struct.gameBoard, %struct.gameBoard* %u98, i1 0, i32 3
	store i32 %u97, i32* %u99
	br label %bb31

bb15:
	%u100 = load i32, i32* %_P_placement
	%u101 = icmp eq i32 %u100, 5
	%u102 = zext i1 %u101 to i32
	%u103 = trunc i32 %u102 to i1
	br i1 %u103, label %bb16, label %bb17

bb16:
	%u104 = load i32, i32* %_P_turn
	%u105 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u106 = getelementptr %struct.gameBoard, %struct.gameBoard* %u105, i1 0, i32 4
	store i32 %u104, i32* %u106
	br label %bb30

bb17:
	%u107 = load i32, i32* %_P_placement
	%u108 = icmp eq i32 %u107, 6
	%u109 = zext i1 %u108 to i32
	%u110 = trunc i32 %u109 to i1
	br i1 %u110, label %bb18, label %bb19

bb18:
	%u111 = load i32, i32* %_P_turn
	%u112 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u113 = getelementptr %struct.gameBoard, %struct.gameBoard* %u112, i1 0, i32 5
	store i32 %u111, i32* %u113
	br label %bb29

bb19:
	%u114 = load i32, i32* %_P_placement
	%u115 = icmp eq i32 %u114, 7
	%u116 = zext i1 %u115 to i32
	%u117 = trunc i32 %u116 to i1
	br i1 %u117, label %bb20, label %bb21

bb20:
	%u118 = load i32, i32* %_P_turn
	%u119 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u120 = getelementptr %struct.gameBoard, %struct.gameBoard* %u119, i1 0, i32 6
	store i32 %u118, i32* %u120
	br label %bb28

bb21:
	%u121 = load i32, i32* %_P_placement
	%u122 = icmp eq i32 %u121, 8
	%u123 = zext i1 %u122 to i32
	%u124 = trunc i32 %u123 to i1
	br i1 %u124, label %bb22, label %bb23

bb22:
	%u125 = load i32, i32* %_P_turn
	%u126 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u127 = getelementptr %struct.gameBoard, %struct.gameBoard* %u126, i1 0, i32 7
	store i32 %u125, i32* %u127
	br label %bb27

bb23:
	%u128 = load i32, i32* %_P_placement
	%u129 = icmp eq i32 %u128, 9
	%u130 = zext i1 %u129 to i32
	%u131 = trunc i32 %u130 to i1
	br i1 %u131, label %bb24, label %bb25

bb24:
	%u132 = load i32, i32* %_P_turn
	%u133 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u134 = getelementptr %struct.gameBoard, %struct.gameBoard* %u133, i1 0, i32 8
	store i32 %u132, i32* %u134
	br label %bb26

bb25:
	br label %bb26

bb26:
	br label %bb27

bb27:
	br label %bb28

bb28:
	br label %bb29

bb29:
	br label %bb30

bb30:
	br label %bb31

bb31:
	br label %bb32

bb32:
	br label %bb33

bb33:
	br label %bb34

bb34:
	br label %bb6

bb6:
	ret void
}

define i32 @checkWinner(%struct.gameBoard* %board)
{

bb36:
	%_retval_ = alloca i32
	%_P_board = alloca %struct.gameBoard*
	store %struct.gameBoard* %board, %struct.gameBoard** %_P_board
	%u135 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u136 = getelementptr %struct.gameBoard, %struct.gameBoard* %u135, i1 0, i32 0
	%u137 = load i32, i32* %u136
	%u138 = icmp eq i32 %u137, 1
	%u139 = zext i1 %u138 to i32
	%u140 = trunc i32 %u139 to i1
	br i1 %u140, label %bb37, label %bb38

bb37:
	%u141 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u142 = getelementptr %struct.gameBoard, %struct.gameBoard* %u141, i1 0, i32 1
	%u143 = load i32, i32* %u142
	%u144 = icmp eq i32 %u143, 1
	%u145 = zext i1 %u144 to i32
	%u146 = trunc i32 %u145 to i1
	br i1 %u146, label %bb39, label %bb40

bb38:
	br label %bb45

bb39:
	%u147 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u148 = getelementptr %struct.gameBoard, %struct.gameBoard* %u147, i1 0, i32 2
	%u149 = load i32, i32* %u148
	%u150 = icmp eq i32 %u149, 1
	%u151 = zext i1 %u150 to i32
	%u152 = trunc i32 %u151 to i1
	br i1 %u152, label %bb41, label %bb42

bb40:
	br label %bb44

bb41:
	store i32 0, i32* %_retval_
	br label %bb35

bb42:
	br label %bb43

bb43:
	br label %bb44

bb44:
	br label %bb45

bb45:
	%u153 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u154 = getelementptr %struct.gameBoard, %struct.gameBoard* %u153, i1 0, i32 0
	%u155 = load i32, i32* %u154
	%u156 = icmp eq i32 %u155, 2
	%u157 = zext i1 %u156 to i32
	%u158 = trunc i32 %u157 to i1
	br i1 %u158, label %bb46, label %bb47

bb46:
	%u159 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u160 = getelementptr %struct.gameBoard, %struct.gameBoard* %u159, i1 0, i32 1
	%u161 = load i32, i32* %u160
	%u162 = icmp eq i32 %u161, 2
	%u163 = zext i1 %u162 to i32
	%u164 = trunc i32 %u163 to i1
	br i1 %u164, label %bb48, label %bb49

bb47:
	br label %bb54

bb48:
	%u165 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u166 = getelementptr %struct.gameBoard, %struct.gameBoard* %u165, i1 0, i32 2
	%u167 = load i32, i32* %u166
	%u168 = icmp eq i32 %u167, 2
	%u169 = zext i1 %u168 to i32
	%u170 = trunc i32 %u169 to i1
	br i1 %u170, label %bb50, label %bb51

bb49:
	br label %bb53

bb50:
	store i32 1, i32* %_retval_
	br label %bb35

bb51:
	br label %bb52

bb52:
	br label %bb53

bb53:
	br label %bb54

bb54:
	%u171 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u172 = getelementptr %struct.gameBoard, %struct.gameBoard* %u171, i1 0, i32 3
	%u173 = load i32, i32* %u172
	%u174 = icmp eq i32 %u173, 1
	%u175 = zext i1 %u174 to i32
	%u176 = trunc i32 %u175 to i1
	br i1 %u176, label %bb55, label %bb56

bb55:
	%u177 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u178 = getelementptr %struct.gameBoard, %struct.gameBoard* %u177, i1 0, i32 4
	%u179 = load i32, i32* %u178
	%u180 = icmp eq i32 %u179, 1
	%u181 = zext i1 %u180 to i32
	%u182 = trunc i32 %u181 to i1
	br i1 %u182, label %bb57, label %bb58

bb56:
	br label %bb63

bb57:
	%u183 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u184 = getelementptr %struct.gameBoard, %struct.gameBoard* %u183, i1 0, i32 5
	%u185 = load i32, i32* %u184
	%u186 = icmp eq i32 %u185, 1
	%u187 = zext i1 %u186 to i32
	%u188 = trunc i32 %u187 to i1
	br i1 %u188, label %bb59, label %bb60

bb58:
	br label %bb62

bb59:
	store i32 0, i32* %_retval_
	br label %bb35

bb60:
	br label %bb61

bb61:
	br label %bb62

bb62:
	br label %bb63

bb63:
	%u189 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u190 = getelementptr %struct.gameBoard, %struct.gameBoard* %u189, i1 0, i32 3
	%u191 = load i32, i32* %u190
	%u192 = icmp eq i32 %u191, 2
	%u193 = zext i1 %u192 to i32
	%u194 = trunc i32 %u193 to i1
	br i1 %u194, label %bb64, label %bb65

bb64:
	%u195 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u196 = getelementptr %struct.gameBoard, %struct.gameBoard* %u195, i1 0, i32 4
	%u197 = load i32, i32* %u196
	%u198 = icmp eq i32 %u197, 2
	%u199 = zext i1 %u198 to i32
	%u200 = trunc i32 %u199 to i1
	br i1 %u200, label %bb66, label %bb67

bb65:
	br label %bb72

bb66:
	%u201 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u202 = getelementptr %struct.gameBoard, %struct.gameBoard* %u201, i1 0, i32 5
	%u203 = load i32, i32* %u202
	%u204 = icmp eq i32 %u203, 2
	%u205 = zext i1 %u204 to i32
	%u206 = trunc i32 %u205 to i1
	br i1 %u206, label %bb68, label %bb69

bb67:
	br label %bb71

bb68:
	store i32 1, i32* %_retval_
	br label %bb35

bb69:
	br label %bb70

bb70:
	br label %bb71

bb71:
	br label %bb72

bb72:
	%u207 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u208 = getelementptr %struct.gameBoard, %struct.gameBoard* %u207, i1 0, i32 6
	%u209 = load i32, i32* %u208
	%u210 = icmp eq i32 %u209, 1
	%u211 = zext i1 %u210 to i32
	%u212 = trunc i32 %u211 to i1
	br i1 %u212, label %bb73, label %bb74

bb73:
	%u213 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u214 = getelementptr %struct.gameBoard, %struct.gameBoard* %u213, i1 0, i32 7
	%u215 = load i32, i32* %u214
	%u216 = icmp eq i32 %u215, 1
	%u217 = zext i1 %u216 to i32
	%u218 = trunc i32 %u217 to i1
	br i1 %u218, label %bb75, label %bb76

bb74:
	br label %bb81

bb75:
	%u219 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u220 = getelementptr %struct.gameBoard, %struct.gameBoard* %u219, i1 0, i32 8
	%u221 = load i32, i32* %u220
	%u222 = icmp eq i32 %u221, 1
	%u223 = zext i1 %u222 to i32
	%u224 = trunc i32 %u223 to i1
	br i1 %u224, label %bb77, label %bb78

bb76:
	br label %bb80

bb77:
	store i32 0, i32* %_retval_
	br label %bb35

bb78:
	br label %bb79

bb79:
	br label %bb80

bb80:
	br label %bb81

bb81:
	%u225 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u226 = getelementptr %struct.gameBoard, %struct.gameBoard* %u225, i1 0, i32 6
	%u227 = load i32, i32* %u226
	%u228 = icmp eq i32 %u227, 2
	%u229 = zext i1 %u228 to i32
	%u230 = trunc i32 %u229 to i1
	br i1 %u230, label %bb82, label %bb83

bb82:
	%u231 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u232 = getelementptr %struct.gameBoard, %struct.gameBoard* %u231, i1 0, i32 7
	%u233 = load i32, i32* %u232
	%u234 = icmp eq i32 %u233, 2
	%u235 = zext i1 %u234 to i32
	%u236 = trunc i32 %u235 to i1
	br i1 %u236, label %bb84, label %bb85

bb83:
	br label %bb90

bb84:
	%u237 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u238 = getelementptr %struct.gameBoard, %struct.gameBoard* %u237, i1 0, i32 8
	%u239 = load i32, i32* %u238
	%u240 = icmp eq i32 %u239, 2
	%u241 = zext i1 %u240 to i32
	%u242 = trunc i32 %u241 to i1
	br i1 %u242, label %bb86, label %bb87

bb85:
	br label %bb89

bb86:
	store i32 1, i32* %_retval_
	br label %bb35

bb87:
	br label %bb88

bb88:
	br label %bb89

bb89:
	br label %bb90

bb90:
	%u243 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u244 = getelementptr %struct.gameBoard, %struct.gameBoard* %u243, i1 0, i32 0
	%u245 = load i32, i32* %u244
	%u246 = icmp eq i32 %u245, 1
	%u247 = zext i1 %u246 to i32
	%u248 = trunc i32 %u247 to i1
	br i1 %u248, label %bb91, label %bb92

bb91:
	%u249 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u250 = getelementptr %struct.gameBoard, %struct.gameBoard* %u249, i1 0, i32 3
	%u251 = load i32, i32* %u250
	%u252 = icmp eq i32 %u251, 1
	%u253 = zext i1 %u252 to i32
	%u254 = trunc i32 %u253 to i1
	br i1 %u254, label %bb93, label %bb94

bb92:
	br label %bb99

bb93:
	%u255 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u256 = getelementptr %struct.gameBoard, %struct.gameBoard* %u255, i1 0, i32 6
	%u257 = load i32, i32* %u256
	%u258 = icmp eq i32 %u257, 1
	%u259 = zext i1 %u258 to i32
	%u260 = trunc i32 %u259 to i1
	br i1 %u260, label %bb95, label %bb96

bb94:
	br label %bb98

bb95:
	store i32 0, i32* %_retval_
	br label %bb35

bb96:
	br label %bb97

bb97:
	br label %bb98

bb98:
	br label %bb99

bb99:
	%u261 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u262 = getelementptr %struct.gameBoard, %struct.gameBoard* %u261, i1 0, i32 0
	%u263 = load i32, i32* %u262
	%u264 = icmp eq i32 %u263, 2
	%u265 = zext i1 %u264 to i32
	%u266 = trunc i32 %u265 to i1
	br i1 %u266, label %bb100, label %bb101

bb100:
	%u267 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u268 = getelementptr %struct.gameBoard, %struct.gameBoard* %u267, i1 0, i32 3
	%u269 = load i32, i32* %u268
	%u270 = icmp eq i32 %u269, 2
	%u271 = zext i1 %u270 to i32
	%u272 = trunc i32 %u271 to i1
	br i1 %u272, label %bb102, label %bb103

bb101:
	br label %bb108

bb102:
	%u273 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u274 = getelementptr %struct.gameBoard, %struct.gameBoard* %u273, i1 0, i32 6
	%u275 = load i32, i32* %u274
	%u276 = icmp eq i32 %u275, 2
	%u277 = zext i1 %u276 to i32
	%u278 = trunc i32 %u277 to i1
	br i1 %u278, label %bb104, label %bb105

bb103:
	br label %bb107

bb104:
	store i32 1, i32* %_retval_
	br label %bb35

bb105:
	br label %bb106

bb106:
	br label %bb107

bb107:
	br label %bb108

bb108:
	%u279 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u280 = getelementptr %struct.gameBoard, %struct.gameBoard* %u279, i1 0, i32 1
	%u281 = load i32, i32* %u280
	%u282 = icmp eq i32 %u281, 1
	%u283 = zext i1 %u282 to i32
	%u284 = trunc i32 %u283 to i1
	br i1 %u284, label %bb109, label %bb110

bb109:
	%u285 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u286 = getelementptr %struct.gameBoard, %struct.gameBoard* %u285, i1 0, i32 4
	%u287 = load i32, i32* %u286
	%u288 = icmp eq i32 %u287, 1
	%u289 = zext i1 %u288 to i32
	%u290 = trunc i32 %u289 to i1
	br i1 %u290, label %bb111, label %bb112

bb110:
	br label %bb117

bb111:
	%u291 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u292 = getelementptr %struct.gameBoard, %struct.gameBoard* %u291, i1 0, i32 7
	%u293 = load i32, i32* %u292
	%u294 = icmp eq i32 %u293, 1
	%u295 = zext i1 %u294 to i32
	%u296 = trunc i32 %u295 to i1
	br i1 %u296, label %bb113, label %bb114

bb112:
	br label %bb116

bb113:
	store i32 0, i32* %_retval_
	br label %bb35

bb114:
	br label %bb115

bb115:
	br label %bb116

bb116:
	br label %bb117

bb117:
	%u297 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u298 = getelementptr %struct.gameBoard, %struct.gameBoard* %u297, i1 0, i32 1
	%u299 = load i32, i32* %u298
	%u300 = icmp eq i32 %u299, 2
	%u301 = zext i1 %u300 to i32
	%u302 = trunc i32 %u301 to i1
	br i1 %u302, label %bb118, label %bb119

bb118:
	%u303 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u304 = getelementptr %struct.gameBoard, %struct.gameBoard* %u303, i1 0, i32 4
	%u305 = load i32, i32* %u304
	%u306 = icmp eq i32 %u305, 2
	%u307 = zext i1 %u306 to i32
	%u308 = trunc i32 %u307 to i1
	br i1 %u308, label %bb120, label %bb121

bb119:
	br label %bb126

bb120:
	%u309 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u310 = getelementptr %struct.gameBoard, %struct.gameBoard* %u309, i1 0, i32 7
	%u311 = load i32, i32* %u310
	%u312 = icmp eq i32 %u311, 2
	%u313 = zext i1 %u312 to i32
	%u314 = trunc i32 %u313 to i1
	br i1 %u314, label %bb122, label %bb123

bb121:
	br label %bb125

bb122:
	store i32 1, i32* %_retval_
	br label %bb35

bb123:
	br label %bb124

bb124:
	br label %bb125

bb125:
	br label %bb126

bb126:
	%u315 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u316 = getelementptr %struct.gameBoard, %struct.gameBoard* %u315, i1 0, i32 2
	%u317 = load i32, i32* %u316
	%u318 = icmp eq i32 %u317, 1
	%u319 = zext i1 %u318 to i32
	%u320 = trunc i32 %u319 to i1
	br i1 %u320, label %bb127, label %bb128

bb127:
	%u321 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u322 = getelementptr %struct.gameBoard, %struct.gameBoard* %u321, i1 0, i32 5
	%u323 = load i32, i32* %u322
	%u324 = icmp eq i32 %u323, 1
	%u325 = zext i1 %u324 to i32
	%u326 = trunc i32 %u325 to i1
	br i1 %u326, label %bb129, label %bb130

bb128:
	br label %bb135

bb129:
	%u327 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u328 = getelementptr %struct.gameBoard, %struct.gameBoard* %u327, i1 0, i32 8
	%u329 = load i32, i32* %u328
	%u330 = icmp eq i32 %u329, 1
	%u331 = zext i1 %u330 to i32
	%u332 = trunc i32 %u331 to i1
	br i1 %u332, label %bb131, label %bb132

bb130:
	br label %bb134

bb131:
	store i32 0, i32* %_retval_
	br label %bb35

bb132:
	br label %bb133

bb133:
	br label %bb134

bb134:
	br label %bb135

bb135:
	%u333 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u334 = getelementptr %struct.gameBoard, %struct.gameBoard* %u333, i1 0, i32 2
	%u335 = load i32, i32* %u334
	%u336 = icmp eq i32 %u335, 2
	%u337 = zext i1 %u336 to i32
	%u338 = trunc i32 %u337 to i1
	br i1 %u338, label %bb136, label %bb137

bb136:
	%u339 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u340 = getelementptr %struct.gameBoard, %struct.gameBoard* %u339, i1 0, i32 5
	%u341 = load i32, i32* %u340
	%u342 = icmp eq i32 %u341, 2
	%u343 = zext i1 %u342 to i32
	%u344 = trunc i32 %u343 to i1
	br i1 %u344, label %bb138, label %bb139

bb137:
	br label %bb144

bb138:
	%u345 = load %struct.gameBoard*, %struct.gameBoard** %_P_board
	%u346 = getelementptr %struct.gameBoard, %struct.gameBoard* %u345, i1 0, i32 8
	%u347 = load i32, i32* %u346
	%u348 = icmp eq i32 %u347, 2
	%u349 = zext i1 %u348 to i32
	%u350 = trunc i32 %u349 to i1
	br i1 %u350, label %bb140, label %bb141

bb139:
	br label %bb143

bb140:
	store i32 1, i32* %_retval_
	br label %bb35

bb141:
	br label %bb142

bb142:
	br label %bb143

bb143:
	br label %bb144

bb144:
	store i32 -1, i32* %_retval_
	br label %bb35

bb35:
	%u351 = load i32, i32* %_retval_
	ret i32 %u351
}

define i32 @main()
{

bb146:
	%_retval_ = alloca i32
	%turn = alloca i32
	%space1 = alloca i32
	%space2 = alloca i32
	%winner = alloca i32
	%i = alloca i32
	%board = alloca %struct.gameBoard*
	store i32 0, i32* %i
	store i32 0, i32* %turn
	store i32 0, i32* %space1
	store i32 0, i32* %space2
	store i32 -1, i32* %winner
	%u352 = call i8* @malloc_helper(i32 72)
	%u353 = bitcast i8* %u352 to %struct.gameBoard*
	store %struct.gameBoard* %u353, %struct.gameBoard** %board
	%u354 = load %struct.gameBoard*, %struct.gameBoard** %board
	call void @cleanBoard(%struct.gameBoard* %u354)
	br label %bb147

bb147:
	%u355 = load i32, i32* %winner
	%u356 = icmp slt i32 %u355, 0
	%u357 = zext i1 %u356 to i32
	%u358 = load i32, i32* %i
	%u359 = icmp ne i32 %u358, 8
	%u360 = zext i1 %u359 to i32
	%u361 = and i32 %u357, %u360
	%u381 = trunc i32 %u361 to i1
	br i1 %u381, label %bb148, label %bb152

bb148:
	%u362 = load %struct.gameBoard*, %struct.gameBoard** %board
	call void @printBoard(%struct.gameBoard* %u362)
	%u363 = load i32, i32* %turn
	%u364 = icmp eq i32 %u363, 0
	%u365 = zext i1 %u364 to i32
	%u366 = trunc i32 %u365 to i1
	br i1 %u366, label %bb149, label %bb150

bb149:
	%u367 = load i32, i32* %turn
	%u368 = add i32 %u367, 1
	store i32 %u368, i32* %turn
	%u369 = call i32 @read_helper()
	store i32 %u369, i32* %space1
	%u370 = load %struct.gameBoard*, %struct.gameBoard** %board
	%u371 = load i32, i32* %space1
	call void @placePiece(%struct.gameBoard* %u370, i32 1, i32 %u371)
	br label %bb151

bb150:
	%u372 = load i32, i32* %turn
	%u373 = sub i32 %u372, 1
	store i32 %u373, i32* %turn
	%u374 = call i32 @read_helper()
	store i32 %u374, i32* %space2
	%u375 = load %struct.gameBoard*, %struct.gameBoard** %board
	%u376 = load i32, i32* %space2
	call void @placePiece(%struct.gameBoard* %u375, i32 2, i32 %u376)
	br label %bb151

bb151:
	%u377 = load %struct.gameBoard*, %struct.gameBoard** %board
	%u378 = call i32 @checkWinner(%struct.gameBoard* %u377)
	store i32 %u378, i32* %winner
	%u379 = load i32, i32* %i
	%u380 = add i32 %u379, 1
	store i32 %u380, i32* %i
	br label %bb147

bb152:
	%u382 = load i32, i32* %winner
	%u383 = add i32 %u382, 1
	%u384 = load i32, i32* %winner
	%u385 = add i32 %u384, 1
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u385)
	store i32 0, i32* %_retval_
	br label %bb145

bb145:
	%u386 = load i32, i32* %_retval_
	ret i32 %u386
}

declare i8* @malloc_helper(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @read_helper()
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1

