target triple="i686"
%struct.thing = type {i32, i32, %struct.thing*}

@gs1 = common global %struct.thing* null, align 8
@gb1 = common global i32 0, align 8
@counter = common global i32 0, align 8
@gi1 = common global i32 0, align 8

define void @printgroup(i32 %groupnum)
{

bb1:
	%_P_groupnum = alloca i32
	store i32 %groupnum, i32* %_P_groupnum
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 1)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 1)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 1)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%u0 = load i32, i32* %_P_groupnum
	%u1 = load i32, i32* %_P_groupnum
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u1)
	br label %bb0

bb0:
	ret void
}

define i32 @setcounter(i32 %val)
{

bb3:
	%_retval_ = alloca i32
	%_P_val = alloca i32
	store i32 %val, i32* %_P_val
	%u2 = load i32, i32* %_P_val
	store i32 %u2, i32* @counter
	store i32 1, i32* %_retval_
	br label %bb2

bb2:
	%u3 = load i32, i32* %_retval_
	ret i32 %u3
}

define void @takealltypes(i32 %i, i32 %b, %struct.thing* %s)
{

bb5:
	%_P_i = alloca i32
	%_P_b = alloca i32
	%_P_s = alloca %struct.thing*
	store i32 %i, i32* %_P_i
	store i32 %b, i32* %_P_b
	store %struct.thing* %s, %struct.thing** %_P_s
	%u4 = load i32, i32* %_P_i
	%u5 = icmp eq i32 %u4, 3
	%u6 = zext i1 %u5 to i32
	%u7 = trunc i32 %u6 to i1
	br i1 %u7, label %bb6, label %bb7

bb6:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb8

bb7:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb8

bb8:
	%u8 = load i32, i32* %_P_b
	%u9 = trunc i32 %u8 to i1
	br i1 %u9, label %bb9, label %bb10

bb9:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb11

bb10:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb11

bb11:
	%u10 = load %struct.thing*, %struct.thing** %_P_s
	%u11 = getelementptr %struct.thing, %struct.thing* %u10, i1 0, i32 1
	%u12 = load i32, i32* %u11
	%u13 = trunc i32 %u12 to i1
	br i1 %u13, label %bb12, label %bb13

bb12:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb14

bb13:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb14

bb14:
	br label %bb4

bb4:
	ret void
}

define void @tonofargs(i32 %a1, i32 %a2, i32 %a3, i32 %a4, i32 %a5, i32 %a6, i32 %a7, i32 %a8)
{

bb16:
	%_P_a1 = alloca i32
	%_P_a2 = alloca i32
	%_P_a3 = alloca i32
	%_P_a4 = alloca i32
	%_P_a5 = alloca i32
	%_P_a6 = alloca i32
	%_P_a7 = alloca i32
	%_P_a8 = alloca i32
	store i32 %a1, i32* %_P_a1
	store i32 %a2, i32* %_P_a2
	store i32 %a3, i32* %_P_a3
	store i32 %a4, i32* %_P_a4
	store i32 %a5, i32* %_P_a5
	store i32 %a6, i32* %_P_a6
	store i32 %a7, i32* %_P_a7
	store i32 %a8, i32* %_P_a8
	%u14 = load i32, i32* %_P_a5
	%u15 = icmp eq i32 %u14, 5
	%u16 = zext i1 %u15 to i32
	%u17 = trunc i32 %u16 to i1
	br i1 %u17, label %bb17, label %bb18

bb17:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb19

bb18:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%u18 = load i32, i32* %_P_a5
	%u19 = load i32, i32* %_P_a5
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u19)
	br label %bb19

bb19:
	%u20 = load i32, i32* %_P_a6
	%u21 = icmp eq i32 %u20, 6
	%u22 = zext i1 %u21 to i32
	%u23 = trunc i32 %u22 to i1
	br i1 %u23, label %bb20, label %bb21

bb20:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb22

bb21:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%u24 = load i32, i32* %_P_a6
	%u25 = load i32, i32* %_P_a6
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u25)
	br label %bb22

bb22:
	%u26 = load i32, i32* %_P_a7
	%u27 = icmp eq i32 %u26, 7
	%u28 = zext i1 %u27 to i32
	%u29 = trunc i32 %u28 to i1
	br i1 %u29, label %bb23, label %bb24

bb23:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb25

bb24:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%u30 = load i32, i32* %_P_a7
	%u31 = load i32, i32* %_P_a7
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u31)
	br label %bb25

bb25:
	%u32 = load i32, i32* %_P_a8
	%u33 = icmp eq i32 %u32, 8
	%u34 = zext i1 %u33 to i32
	%u35 = trunc i32 %u34 to i1
	br i1 %u35, label %bb26, label %bb27

bb26:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb28

bb27:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%u36 = load i32, i32* %_P_a8
	%u37 = load i32, i32* %_P_a8
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u37)
	br label %bb28

bb28:
	br label %bb15

bb15:
	ret void
}

define i32 @returnint(i32 %ret)
{

bb30:
	%_retval_ = alloca i32
	%_P_ret = alloca i32
	store i32 %ret, i32* %_P_ret
	%u38 = load i32, i32* %_P_ret
	store i32 %u38, i32* %_retval_
	br label %bb29

bb29:
	%u39 = load i32, i32* %_retval_
	ret i32 %u39
}

define i32 @returnbool(i32 %ret)
{

bb32:
	%_retval_ = alloca i32
	%_P_ret = alloca i32
	store i32 %ret, i32* %_P_ret
	%u40 = load i32, i32* %_P_ret
	store i32 %u40, i32* %_retval_
	br label %bb31

bb31:
	%u41 = load i32, i32* %_retval_
	ret i32 %u41
}

define %struct.thing* @returnstruct(%struct.thing* %ret)
{

bb34:
	%_retval_ = alloca %struct.thing*
	%_P_ret = alloca %struct.thing*
	store %struct.thing* %ret, %struct.thing** %_P_ret
	%u42 = load %struct.thing*, %struct.thing** %_P_ret
	store %struct.thing* %u42, %struct.thing** %_retval_
	br label %bb33

bb33:
	%u43 = load %struct.thing*, %struct.thing** %_retval_
	ret %struct.thing* %u43
}

define i32 @main()
{

bb36:
	%_retval_ = alloca i32
	%b1 = alloca i32
	%b2 = alloca i32
	%i1 = alloca i32
	%i2 = alloca i32
	%i3 = alloca i32
	%s1 = alloca %struct.thing*
	%s2 = alloca %struct.thing*
	store i32 0, i32* @counter
	call void @printgroup(i32 1)
	store i32 1, i32* %b1
	store i32 1, i32* %b2
	%u44 = load i32, i32* %b1
	%u45 = load i32, i32* %b2
	%u46 = and i32 %u44, %u45
	%u47 = trunc i32 %u46 to i1
	br i1 %u47, label %bb37, label %bb38

bb37:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb39

bb38:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb39

bb39:
	store i32 1, i32* %b1
	store i32 1, i32* %b2
	%u48 = load i32, i32* %b1
	%u49 = load i32, i32* %b2
	%u50 = and i32 %u48, %u49
	%u51 = trunc i32 %u50 to i1
	br i1 %u51, label %bb40, label %bb41

bb40:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb42

bb41:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb42

bb42:
	store i32 1, i32* %b1
	store i32 1, i32* %b2
	%u52 = load i32, i32* %b1
	%u53 = load i32, i32* %b2
	%u54 = and i32 %u52, %u53
	%u55 = trunc i32 %u54 to i1
	br i1 %u55, label %bb43, label %bb44

bb43:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb45

bb44:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb45

bb45:
	store i32 1, i32* %b1
	store i32 1, i32* %b2
	%u56 = load i32, i32* %b1
	%u57 = load i32, i32* %b2
	%u58 = and i32 %u56, %u57
	%u59 = trunc i32 %u58 to i1
	br i1 %u59, label %bb46, label %bb47

bb46:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb48

bb47:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb48

bb48:
	store i32 0, i32* @counter
	call void @printgroup(i32 2)
	store i32 1, i32* %b1
	store i32 1, i32* %b2
	%u60 = load i32, i32* %b1
	%u61 = load i32, i32* %b2
	%u62 = or i32 %u60, %u61
	%u63 = trunc i32 %u62 to i1
	br i1 %u63, label %bb49, label %bb50

bb49:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb51

bb50:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb51

bb51:
	store i32 1, i32* %b1
	store i32 1, i32* %b2
	%u64 = load i32, i32* %b1
	%u65 = load i32, i32* %b2
	%u66 = or i32 %u64, %u65
	%u67 = trunc i32 %u66 to i1
	br i1 %u67, label %bb52, label %bb53

bb52:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb54

bb53:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb54

bb54:
	store i32 1, i32* %b1
	store i32 1, i32* %b2
	%u68 = load i32, i32* %b1
	%u69 = load i32, i32* %b2
	%u70 = or i32 %u68, %u69
	%u71 = trunc i32 %u70 to i1
	br i1 %u71, label %bb55, label %bb56

bb55:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb57

bb56:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb57

bb57:
	store i32 1, i32* %b1
	store i32 1, i32* %b2
	%u72 = load i32, i32* %b1
	%u73 = load i32, i32* %b2
	%u74 = or i32 %u72, %u73
	%u75 = trunc i32 %u74 to i1
	br i1 %u75, label %bb58, label %bb59

bb58:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb60

bb59:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb60

bb60:
	call void @printgroup(i32 3)
	%u76 = icmp sgt i32 42, 1
	%u77 = zext i1 %u76 to i32
	%u78 = trunc i32 %u77 to i1
	br i1 %u78, label %bb61, label %bb62

bb61:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb63

bb62:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb63

bb63:
	%u79 = icmp sge i32 42, 1
	%u80 = zext i1 %u79 to i32
	%u81 = trunc i32 %u80 to i1
	br i1 %u81, label %bb64, label %bb65

bb64:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb66

bb65:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb66

bb66:
	%u82 = icmp slt i32 42, 1
	%u83 = zext i1 %u82 to i32
	%u84 = trunc i32 %u83 to i1
	br i1 %u84, label %bb67, label %bb68

bb67:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb69

bb68:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb69

bb69:
	%u85 = icmp sle i32 42, 1
	%u86 = zext i1 %u85 to i32
	%u87 = trunc i32 %u86 to i1
	br i1 %u87, label %bb70, label %bb71

bb70:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb72

bb71:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb72

bb72:
	%u88 = icmp eq i32 42, 1
	%u89 = zext i1 %u88 to i32
	%u90 = trunc i32 %u89 to i1
	br i1 %u90, label %bb73, label %bb74

bb73:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb75

bb74:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb75

bb75:
	%u91 = icmp ne i32 42, 1
	%u92 = zext i1 %u91 to i32
	%u93 = trunc i32 %u92 to i1
	br i1 %u93, label %bb76, label %bb77

bb76:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb78

bb77:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb78

bb78:
	br i1 1, label %bb79, label %bb80

bb79:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb81

bb80:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb81

bb81:
	br i1 0, label %bb82, label %bb83

bb82:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb84

bb83:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb84

bb84:
	br i1 1, label %bb85, label %bb86

bb85:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb87

bb86:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb87

bb87:
	br i1 0, label %bb88, label %bb89

bb88:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb90

bb89:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb90

bb90:
	br i1 0, label %bb91, label %bb92

bb91:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb93

bb92:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb93

bb93:
	call void @printgroup(i32 4)
	%u94 = add i32 2, 3
	%u95 = icmp eq i32 %u94, 5
	%u96 = zext i1 %u95 to i32
	%u97 = trunc i32 %u96 to i1
	br i1 %u97, label %bb94, label %bb95

bb94:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb96

bb95:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%u98 = add i32 2, 3
	%u99 = add i32 2, 3
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u99)
	br label %bb96

bb96:
	%u100 = mul i32 2, 3
	%u101 = icmp eq i32 %u100, 6
	%u102 = zext i1 %u101 to i32
	%u103 = trunc i32 %u102 to i1
	br i1 %u103, label %bb97, label %bb98

bb97:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb99

bb98:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%u104 = mul i32 2, 3
	%u105 = mul i32 2, 3
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u105)
	br label %bb99

bb99:
	%u106 = sub i32 3, 2
	%u107 = icmp eq i32 %u106, 1
	%u108 = zext i1 %u107 to i32
	%u109 = trunc i32 %u108 to i1
	br i1 %u109, label %bb100, label %bb101

bb100:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb102

bb101:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%u110 = sub i32 3, 2
	%u111 = sub i32 3, 2
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u111)
	br label %bb102

bb102:
	%u112 = sdiv i32 6, 3
	%u113 = icmp eq i32 %u112, 2
	%u114 = zext i1 %u113 to i32
	%u115 = trunc i32 %u114 to i1
	br i1 %u115, label %bb103, label %bb104

bb103:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb105

bb104:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%u116 = sdiv i32 6, 3
	%u117 = sdiv i32 6, 3
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u117)
	br label %bb105

bb105:
	%u118 = icmp slt i32 -6, 0
	%u119 = zext i1 %u118 to i32
	%u120 = trunc i32 %u119 to i1
	br i1 %u120, label %bb106, label %bb107

bb106:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb108

bb107:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb108

bb108:
	call void @printgroup(i32 5)
	store i32 42, i32* %i1
	%u121 = load i32, i32* %i1
	%u122 = icmp eq i32 %u121, 42
	%u123 = zext i1 %u122 to i32
	%u124 = trunc i32 %u123 to i1
	br i1 %u124, label %bb109, label %bb110

bb109:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb111

bb110:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb111

bb111:
	store i32 3, i32* %i1
	store i32 2, i32* %i2
	%u125 = load i32, i32* %i1
	%u126 = load i32, i32* %i2
	%u127 = add i32 %u125, %u126
	store i32 %u127, i32* %i3
	%u128 = load i32, i32* %i3
	%u129 = icmp eq i32 %u128, 5
	%u130 = zext i1 %u129 to i32
	%u131 = trunc i32 %u130 to i1
	br i1 %u131, label %bb112, label %bb113

bb112:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb114

bb113:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb114

bb114:
	store i32 1, i32* %b1
	%u132 = load i32, i32* %b1
	%u133 = trunc i32 %u132 to i1
	br i1 %u133, label %bb115, label %bb116

bb115:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb117

bb116:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb117

bb117:
	%u134 = load i32, i32* %b1
	%u135 = xor i32 %u134, 1
	%u136 = trunc i32 %u135 to i1
	br i1 %u136, label %bb118, label %bb119

bb118:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb120

bb119:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb120

bb120:
	store i32 1, i32* %b1
	%u137 = load i32, i32* %b1
	%u138 = trunc i32 %u137 to i1
	br i1 %u138, label %bb121, label %bb122

bb121:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb123

bb122:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb123

bb123:
	%u139 = load i32, i32* %b1
	%u140 = xor i32 %u139, 1
	%u141 = trunc i32 %u140 to i1
	br i1 %u141, label %bb124, label %bb125

bb124:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb126

bb125:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb126

bb126:
	%u142 = load i32, i32* %b1
	%u143 = trunc i32 %u142 to i1
	br i1 %u143, label %bb127, label %bb128

bb127:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb129

bb128:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb129

bb129:
	call void @printgroup(i32 6)
	store i32 0, i32* %i1
	br label %bb130

bb130:
	%u144 = load i32, i32* %i1
	%u145 = icmp slt i32 %u144, 5
	%u146 = zext i1 %u145 to i32
	%u153 = trunc i32 %u146 to i1
	br i1 %u153, label %bb131, label %bb135

bb131:
	%u147 = load i32, i32* %i1
	%u148 = icmp sge i32 %u147, 5
	%u149 = zext i1 %u148 to i32
	%u150 = trunc i32 %u149 to i1
	br i1 %u150, label %bb132, label %bb133

bb132:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb134

bb133:
	br label %bb134

bb134:
	%u151 = load i32, i32* %i1
	%u152 = add i32 %u151, 5
	store i32 %u152, i32* %i1
	br label %bb130

bb135:
	%u154 = load i32, i32* %i1
	%u155 = icmp eq i32 %u154, 5
	%u156 = zext i1 %u155 to i32
	%u157 = trunc i32 %u156 to i1
	br i1 %u157, label %bb136, label %bb137

bb136:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb138

bb137:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%u158 = load i32, i32* %i1
	%u159 = load i32, i32* %i1
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u159)
	br label %bb138

bb138:
	call void @printgroup(i32 7)
	%u160 = call i8* @malloc_helper(i32 24)
	%u161 = bitcast i8* %u160 to %struct.thing*
	store %struct.thing* %u161, %struct.thing** %s1
	%u162 = load %struct.thing*, %struct.thing** %s1
	%u163 = getelementptr %struct.thing, %struct.thing* %u162, i1 0, i32 0
	store i32 42, i32* %u163
	%u164 = load %struct.thing*, %struct.thing** %s1
	%u165 = getelementptr %struct.thing, %struct.thing* %u164, i1 0, i32 1
	store i32 1, i32* %u165
	%u166 = load %struct.thing*, %struct.thing** %s1
	%u167 = getelementptr %struct.thing, %struct.thing* %u166, i1 0, i32 0
	%u168 = load i32, i32* %u167
	%u169 = icmp eq i32 %u168, 42
	%u170 = zext i1 %u169 to i32
	%u171 = trunc i32 %u170 to i1
	br i1 %u171, label %bb139, label %bb140

bb139:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb141

bb140:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%u172 = load %struct.thing*, %struct.thing** %s1
	%u173 = getelementptr %struct.thing, %struct.thing* %u172, i1 0, i32 0
	%u174 = load i32, i32* %u173
	%u175 = load %struct.thing*, %struct.thing** %s1
	%u176 = getelementptr %struct.thing, %struct.thing* %u175, i1 0, i32 0
	%u177 = load i32, i32* %u176
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u177)
	br label %bb141

bb141:
	%u178 = load %struct.thing*, %struct.thing** %s1
	%u179 = getelementptr %struct.thing, %struct.thing* %u178, i1 0, i32 1
	%u180 = load i32, i32* %u179
	%u181 = trunc i32 %u180 to i1
	br i1 %u181, label %bb142, label %bb143

bb142:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb144

bb143:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb144

bb144:
	%u182 = call i8* @malloc_helper(i32 24)
	%u183 = bitcast i8* %u182 to %struct.thing*
	%u184 = load %struct.thing*, %struct.thing** %s1
	%u185 = getelementptr %struct.thing, %struct.thing* %u184, i1 0, i32 2
	store %struct.thing* %u183, %struct.thing** %u185
	%u186 = load %struct.thing*, %struct.thing** %s1
	%u187 = getelementptr %struct.thing, %struct.thing* %u186, i1 0, i32 2
	%u188 = load %struct.thing*, %struct.thing** %u187
	%u189 = getelementptr %struct.thing, %struct.thing* %u188, i1 0, i32 0
	store i32 13, i32* %u189
	%u190 = load %struct.thing*, %struct.thing** %s1
	%u191 = getelementptr %struct.thing, %struct.thing* %u190, i1 0, i32 2
	%u192 = load %struct.thing*, %struct.thing** %u191
	%u193 = getelementptr %struct.thing, %struct.thing* %u192, i1 0, i32 1
	store i32 1, i32* %u193
	%u194 = load %struct.thing*, %struct.thing** %s1
	%u195 = getelementptr %struct.thing, %struct.thing* %u194, i1 0, i32 2
	%u196 = load %struct.thing*, %struct.thing** %u195
	%u197 = getelementptr %struct.thing, %struct.thing* %u196, i1 0, i32 0
	%u198 = load i32, i32* %u197
	%u199 = icmp eq i32 %u198, 13
	%u200 = zext i1 %u199 to i32
	%u201 = trunc i32 %u200 to i1
	br i1 %u201, label %bb145, label %bb146

bb145:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb147

bb146:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%u202 = load %struct.thing*, %struct.thing** %s1
	%u203 = getelementptr %struct.thing, %struct.thing* %u202, i1 0, i32 2
	%u204 = load %struct.thing*, %struct.thing** %u203
	%u205 = getelementptr %struct.thing, %struct.thing* %u204, i1 0, i32 0
	%u206 = load i32, i32* %u205
	%u207 = load %struct.thing*, %struct.thing** %s1
	%u208 = getelementptr %struct.thing, %struct.thing* %u207, i1 0, i32 2
	%u209 = load %struct.thing*, %struct.thing** %u208
	%u210 = getelementptr %struct.thing, %struct.thing* %u209, i1 0, i32 0
	%u211 = load i32, i32* %u210
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u211)
	br label %bb147

bb147:
	%u212 = load %struct.thing*, %struct.thing** %s1
	%u213 = getelementptr %struct.thing, %struct.thing* %u212, i1 0, i32 2
	%u214 = load %struct.thing*, %struct.thing** %u213
	%u215 = getelementptr %struct.thing, %struct.thing* %u214, i1 0, i32 1
	%u216 = load i32, i32* %u215
	%u217 = xor i32 %u216, 1
	%u218 = trunc i32 %u217 to i1
	br i1 %u218, label %bb148, label %bb149

bb148:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb150

bb149:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb150

bb150:
	%u219 = load %struct.thing*, %struct.thing** %s1
	%u220 = load %struct.thing*, %struct.thing** %s1
	%u221 = icmp eq %struct.thing* %u219, %u220
	%u222 = zext i1 %u221 to i32
	%u223 = trunc i32 %u222 to i1
	br i1 %u223, label %bb151, label %bb152

bb151:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb153

bb152:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb153

bb153:
	%u224 = load %struct.thing*, %struct.thing** %s1
	%u225 = load %struct.thing*, %struct.thing** %s1
	%u226 = getelementptr %struct.thing, %struct.thing* %u225, i1 0, i32 2
	%u227 = load %struct.thing*, %struct.thing** %u226
	%u228 = icmp ne %struct.thing* %u224, %u227
	%u229 = zext i1 %u228 to i32
	%u230 = trunc i32 %u229 to i1
	br i1 %u230, label %bb154, label %bb155

bb154:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb156

bb155:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb156

bb156:
	%u231 = load %struct.thing*, %struct.thing** %s1
	%u232 = getelementptr %struct.thing, %struct.thing* %u231, i1 0, i32 2
	%u233 = load %struct.thing*, %struct.thing** %u232
	%u234 = bitcast %struct.thing* %u233 to i8*
	call void @free(i8* %u234)
	%u235 = load %struct.thing*, %struct.thing** %s1
	%u236 = bitcast %struct.thing* %u235 to i8*
	call void @free(i8* %u236)
	call void @printgroup(i32 8)
	store i32 7, i32* @gi1
	%u237 = load i32, i32* @gi1
	%u238 = icmp eq i32 %u237, 7
	%u239 = zext i1 %u238 to i32
	%u240 = trunc i32 %u239 to i1
	br i1 %u240, label %bb157, label %bb158

bb157:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb159

bb158:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%u241 = load i32, i32* @gi1
	%u242 = load i32, i32* @gi1
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u242)
	br label %bb159

bb159:
	store i32 1, i32* @gb1
	%u243 = load i32, i32* @gb1
	%u244 = trunc i32 %u243 to i1
	br i1 %u244, label %bb160, label %bb161

bb160:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb162

bb161:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb162

bb162:
	%u245 = call i8* @malloc_helper(i32 24)
	%u246 = bitcast i8* %u245 to %struct.thing*
	store %struct.thing* %u246, %struct.thing** @gs1
	%u247 = load %struct.thing*, %struct.thing** @gs1
	%u248 = getelementptr %struct.thing, %struct.thing* %u247, i1 0, i32 0
	store i32 34, i32* %u248
	%u249 = load %struct.thing*, %struct.thing** @gs1
	%u250 = getelementptr %struct.thing, %struct.thing* %u249, i1 0, i32 1
	store i32 1, i32* %u250
	%u251 = load %struct.thing*, %struct.thing** @gs1
	%u252 = getelementptr %struct.thing, %struct.thing* %u251, i1 0, i32 0
	%u253 = load i32, i32* %u252
	%u254 = icmp eq i32 %u253, 34
	%u255 = zext i1 %u254 to i32
	%u256 = trunc i32 %u255 to i1
	br i1 %u256, label %bb163, label %bb164

bb163:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb165

bb164:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%u257 = load %struct.thing*, %struct.thing** @gs1
	%u258 = getelementptr %struct.thing, %struct.thing* %u257, i1 0, i32 0
	%u259 = load i32, i32* %u258
	%u260 = load %struct.thing*, %struct.thing** @gs1
	%u261 = getelementptr %struct.thing, %struct.thing* %u260, i1 0, i32 0
	%u262 = load i32, i32* %u261
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u262)
	br label %bb165

bb165:
	%u263 = load %struct.thing*, %struct.thing** @gs1
	%u264 = getelementptr %struct.thing, %struct.thing* %u263, i1 0, i32 1
	%u265 = load i32, i32* %u264
	%u266 = xor i32 %u265, 1
	%u267 = trunc i32 %u266 to i1
	br i1 %u267, label %bb166, label %bb167

bb166:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb168

bb167:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb168

bb168:
	%u268 = call i8* @malloc_helper(i32 24)
	%u269 = bitcast i8* %u268 to %struct.thing*
	%u270 = load %struct.thing*, %struct.thing** @gs1
	%u271 = getelementptr %struct.thing, %struct.thing* %u270, i1 0, i32 2
	store %struct.thing* %u269, %struct.thing** %u271
	%u272 = load %struct.thing*, %struct.thing** @gs1
	%u273 = getelementptr %struct.thing, %struct.thing* %u272, i1 0, i32 2
	%u274 = load %struct.thing*, %struct.thing** %u273
	%u275 = getelementptr %struct.thing, %struct.thing* %u274, i1 0, i32 0
	store i32 16, i32* %u275
	%u276 = load %struct.thing*, %struct.thing** @gs1
	%u277 = getelementptr %struct.thing, %struct.thing* %u276, i1 0, i32 2
	%u278 = load %struct.thing*, %struct.thing** %u277
	%u279 = getelementptr %struct.thing, %struct.thing* %u278, i1 0, i32 1
	store i32 1, i32* %u279
	%u280 = load %struct.thing*, %struct.thing** @gs1
	%u281 = getelementptr %struct.thing, %struct.thing* %u280, i1 0, i32 2
	%u282 = load %struct.thing*, %struct.thing** %u281
	%u283 = getelementptr %struct.thing, %struct.thing* %u282, i1 0, i32 0
	%u284 = load i32, i32* %u283
	%u285 = icmp eq i32 %u284, 16
	%u286 = zext i1 %u285 to i32
	%u287 = trunc i32 %u286 to i1
	br i1 %u287, label %bb169, label %bb170

bb169:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb171

bb170:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%u288 = load %struct.thing*, %struct.thing** @gs1
	%u289 = getelementptr %struct.thing, %struct.thing* %u288, i1 0, i32 2
	%u290 = load %struct.thing*, %struct.thing** %u289
	%u291 = getelementptr %struct.thing, %struct.thing* %u290, i1 0, i32 0
	%u292 = load i32, i32* %u291
	%u293 = load %struct.thing*, %struct.thing** @gs1
	%u294 = getelementptr %struct.thing, %struct.thing* %u293, i1 0, i32 2
	%u295 = load %struct.thing*, %struct.thing** %u294
	%u296 = getelementptr %struct.thing, %struct.thing* %u295, i1 0, i32 0
	%u297 = load i32, i32* %u296
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u297)
	br label %bb171

bb171:
	%u298 = load %struct.thing*, %struct.thing** @gs1
	%u299 = getelementptr %struct.thing, %struct.thing* %u298, i1 0, i32 2
	%u300 = load %struct.thing*, %struct.thing** %u299
	%u301 = getelementptr %struct.thing, %struct.thing* %u300, i1 0, i32 1
	%u302 = load i32, i32* %u301
	%u303 = trunc i32 %u302 to i1
	br i1 %u303, label %bb172, label %bb173

bb172:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb174

bb173:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb174

bb174:
	%u304 = load %struct.thing*, %struct.thing** @gs1
	%u305 = getelementptr %struct.thing, %struct.thing* %u304, i1 0, i32 2
	%u306 = load %struct.thing*, %struct.thing** %u305
	%u307 = bitcast %struct.thing* %u306 to i8*
	call void @free(i8* %u307)
	%u308 = load %struct.thing*, %struct.thing** @gs1
	%u309 = bitcast %struct.thing* %u308 to i8*
	call void @free(i8* %u309)
	call void @printgroup(i32 9)
	%u310 = call i8* @malloc_helper(i32 24)
	%u311 = bitcast i8* %u310 to %struct.thing*
	store %struct.thing* %u311, %struct.thing** %s1
	%u312 = load %struct.thing*, %struct.thing** %s1
	%u313 = getelementptr %struct.thing, %struct.thing* %u312, i1 0, i32 1
	store i32 1, i32* %u313
	%u314 = load %struct.thing*, %struct.thing** %s1
	call void @takealltypes(i32 3, i32 1, %struct.thing* %u314)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 2)
	call void @tonofargs(i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 3)
	%u315 = call i32 @returnint(i32 3)
	store i32 %u315, i32* %i1
	%u316 = load i32, i32* %i1
	%u317 = icmp eq i32 %u316, 3
	%u318 = zext i1 %u317 to i32
	%u319 = trunc i32 %u318 to i1
	br i1 %u319, label %bb175, label %bb176

bb175:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb177

bb176:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 0)
	%u320 = load i32, i32* %i1
	%u321 = load i32, i32* %i1
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u321)
	br label %bb177

bb177:
	%u322 = call i32 @returnbool(i32 1)
	store i32 %u322, i32* %b1
	%u323 = load i32, i32* %b1
	%u324 = trunc i32 %u323 to i1
	br i1 %u324, label %bb178, label %bb179

bb178:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb180

bb179:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb180

bb180:
	%u325 = call i8* @malloc_helper(i32 24)
	%u326 = bitcast i8* %u325 to %struct.thing*
	store %struct.thing* %u326, %struct.thing** %s1
	%u327 = load %struct.thing*, %struct.thing** %s1
	%u328 = call %struct.thing* @returnstruct(%struct.thing* %u327)
	store %struct.thing* %u328, %struct.thing** %s2
	%u329 = load %struct.thing*, %struct.thing** %s1
	%u330 = load %struct.thing*, %struct.thing** %s2
	%u331 = icmp eq %struct.thing* %u329, %u330
	%u332 = zext i1 %u331 to i32
	%u333 = trunc i32 %u332 to i1
	br i1 %u333, label %bb181, label %bb182

bb181:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %bb183

bb182:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %bb183

bb183:
	call void @printgroup(i32 10)
	store i32 0, i32* %_retval_
	br label %bb35

bb35:
	%u334 = load i32, i32* %_retval_
	ret i32 %u334
}

declare i8* @malloc_helper(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @read_helper()
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1

