target triple="i686"

@global3 = common global i32 0, align 8
@global2 = common global i32 0, align 8
@global1 = common global i32 0, align 8

define i32 @constantFolding()
{

bb1:
	%_retval_ = alloca i32
	%a = alloca i32
	%u0 = mul i32 8, 9
	%u1 = sdiv i32 %u0, 4
	%u2 = add i32 %u1, 2
	%u3 = mul i32 5, 8
	%u4 = sub i32 %u2, %u3
	%u5 = add i32 %u4, 9
	%u6 = sub i32 %u5, 12
	%u7 = add i32 %u6, 6
	%u8 = sub i32 %u7, 9
	%u9 = sub i32 %u8, 18
	%u10 = mul i32 23, 3
	%u11 = sdiv i32 %u10, 23
	%u12 = mul i32 %u11, 90
	%u13 = add i32 %u9, %u12
	store i32 %u13, i32* %a
	%u14 = load i32, i32* %a
	store i32 %u14, i32* %_retval_
	br label %bb0

bb0:
	%u15 = load i32, i32* %_retval_
	ret i32 %u15
}

define i32 @constantPropagation()
{

bb3:
	%_retval_ = alloca i32
	%a = alloca i32
	%b = alloca i32
	%c = alloca i32
	%d = alloca i32
	%e = alloca i32
	%f = alloca i32
	%g = alloca i32
	%h = alloca i32
	%i = alloca i32
	%j = alloca i32
	%k = alloca i32
	%l = alloca i32
	%m = alloca i32
	%n = alloca i32
	%o = alloca i32
	%p = alloca i32
	%q = alloca i32
	%r = alloca i32
	%s = alloca i32
	%t = alloca i32
	%u = alloca i32
	%v = alloca i32
	%w = alloca i32
	%x = alloca i32
	%y = alloca i32
	%z = alloca i32
	store i32 4, i32* %a
	store i32 7, i32* %b
	store i32 8, i32* %c
	store i32 5, i32* %d
	store i32 11, i32* %e
	store i32 21, i32* %f
	%u16 = load i32, i32* %a
	%u17 = load i32, i32* %b
	%u18 = add i32 %u16, %u17
	store i32 %u18, i32* %g
	%u19 = load i32, i32* %c
	%u20 = load i32, i32* %d
	%u21 = add i32 %u19, %u20
	store i32 %u21, i32* %h
	%u22 = load i32, i32* %e
	%u23 = load i32, i32* %f
	%u24 = add i32 %u22, %u23
	store i32 %u24, i32* %i
	%u25 = load i32, i32* %g
	%u26 = load i32, i32* %h
	%u27 = add i32 %u25, %u26
	store i32 %u27, i32* %j
	%u28 = load i32, i32* %i
	%u29 = load i32, i32* %j
	%u30 = mul i32 %u28, %u29
	store i32 %u30, i32* %k
	%u31 = load i32, i32* %e
	%u32 = load i32, i32* %h
	%u33 = load i32, i32* %i
	%u34 = mul i32 %u32, %u33
	%u35 = add i32 %u31, %u34
	%u36 = load i32, i32* %k
	%u37 = sub i32 %u35, %u36
	store i32 %u37, i32* %l
	%u38 = load i32, i32* %h
	%u39 = load i32, i32* %i
	%u40 = load i32, i32* %j
	%u41 = mul i32 %u39, %u40
	%u42 = sub i32 %u38, %u41
	%u43 = load i32, i32* %k
	%u44 = load i32, i32* %l
	%u45 = sdiv i32 %u43, %u44
	%u46 = add i32 %u42, %u45
	store i32 %u46, i32* %m
	%u47 = load i32, i32* %e
	%u48 = load i32, i32* %f
	%u49 = add i32 %u47, %u48
	%u50 = load i32, i32* %g
	%u51 = add i32 %u49, %u50
	%u52 = load i32, i32* %h
	%u53 = add i32 %u51, %u52
	%u54 = load i32, i32* %i
	%u55 = add i32 %u53, %u54
	%u56 = load i32, i32* %j
	%u57 = sub i32 %u55, %u56
	store i32 %u57, i32* %n
	%u58 = load i32, i32* %n
	%u59 = load i32, i32* %m
	%u60 = sub i32 %u58, %u59
	%u61 = load i32, i32* %h
	%u62 = add i32 %u60, %u61
	%u63 = load i32, i32* %a
	%u64 = sub i32 %u62, %u63
	%u65 = load i32, i32* %b
	%u66 = sub i32 %u64, %u65
	store i32 %u66, i32* %o
	%u67 = load i32, i32* %k
	%u68 = load i32, i32* %l
	%u69 = add i32 %u67, %u68
	%u70 = load i32, i32* %g
	%u71 = sub i32 %u69, %u70
	%u72 = load i32, i32* %h
	%u73 = sub i32 %u71, %u72
	store i32 %u73, i32* %p
	%u74 = load i32, i32* %b
	%u75 = load i32, i32* %a
	%u76 = sub i32 %u74, %u75
	%u77 = load i32, i32* %d
	%u78 = mul i32 %u76, %u77
	%u79 = load i32, i32* %i
	%u80 = sub i32 %u78, %u79
	store i32 %u80, i32* %q
	%u81 = load i32, i32* %l
	%u82 = load i32, i32* %c
	%u83 = mul i32 %u81, %u82
	%u84 = load i32, i32* %d
	%u85 = mul i32 %u83, %u84
	%u86 = load i32, i32* %o
	%u87 = add i32 %u85, %u86
	store i32 %u87, i32* %r
	%u88 = load i32, i32* %b
	%u89 = load i32, i32* %a
	%u90 = mul i32 %u88, %u89
	%u91 = load i32, i32* %c
	%u92 = mul i32 %u90, %u91
	%u93 = load i32, i32* %e
	%u94 = sdiv i32 %u92, %u93
	%u95 = load i32, i32* %o
	%u96 = sub i32 %u94, %u95
	store i32 %u96, i32* %s
	%u97 = load i32, i32* %i
	%u98 = load i32, i32* %k
	%u99 = add i32 %u97, %u98
	%u100 = load i32, i32* %c
	%u101 = add i32 %u99, %u100
	%u102 = load i32, i32* %p
	%u103 = sub i32 %u101, %u102
	store i32 %u103, i32* %t
	%u104 = load i32, i32* %n
	%u105 = load i32, i32* %o
	%u106 = add i32 %u104, %u105
	%u107 = load i32, i32* %f
	%u108 = load i32, i32* %a
	%u109 = mul i32 %u107, %u108
	%u110 = sub i32 %u106, %u109
	store i32 %u110, i32* %u
	%u111 = load i32, i32* %a
	%u112 = load i32, i32* %b
	%u113 = mul i32 %u111, %u112
	%u114 = load i32, i32* %k
	%u115 = sub i32 %u113, %u114
	%u116 = load i32, i32* %l
	%u117 = sub i32 %u115, %u116
	store i32 %u117, i32* %v
	%u118 = load i32, i32* %v
	%u119 = load i32, i32* %s
	%u120 = sub i32 %u118, %u119
	%u121 = load i32, i32* %r
	%u122 = load i32, i32* %d
	%u123 = mul i32 %u121, %u122
	%u124 = sub i32 %u120, %u123
	store i32 %u124, i32* %w
	%u125 = load i32, i32* %o
	%u126 = load i32, i32* %w
	%u127 = sub i32 %u125, %u126
	%u128 = load i32, i32* %v
	%u129 = sub i32 %u127, %u128
	%u130 = load i32, i32* %n
	%u131 = sub i32 %u129, %u130
	store i32 %u131, i32* %x
	%u132 = load i32, i32* %p
	%u133 = load i32, i32* %x
	%u134 = mul i32 %u132, %u133
	%u135 = load i32, i32* %t
	%u136 = add i32 %u134, %u135
	%u137 = load i32, i32* %w
	%u138 = sub i32 %u136, %u137
	store i32 %u138, i32* %y
	%u139 = load i32, i32* %w
	%u140 = load i32, i32* %x
	%u141 = sub i32 %u139, %u140
	%u142 = load i32, i32* %y
	%u143 = add i32 %u141, %u142
	%u144 = load i32, i32* %k
	%u145 = add i32 %u143, %u144
	store i32 %u145, i32* %z
	%u146 = load i32, i32* %z
	store i32 %u146, i32* %_retval_
	br label %bb2

bb2:
	%u147 = load i32, i32* %_retval_
	ret i32 %u147
}

define i32 @deadCodeElimination()
{

bb5:
	%_retval_ = alloca i32
	%a = alloca i32
	%b = alloca i32
	%c = alloca i32
	%d = alloca i32
	%e = alloca i32
	store i32 4, i32* %a
	store i32 5, i32* %a
	store i32 7, i32* %a
	store i32 8, i32* %a
	store i32 6, i32* %b
	store i32 9, i32* %b
	store i32 12, i32* %b
	store i32 8, i32* %b
	store i32 10, i32* %c
	store i32 13, i32* %c
	store i32 9, i32* %c
	store i32 45, i32* %d
	store i32 12, i32* %d
	store i32 3, i32* %d
	store i32 23, i32* %e
	store i32 10, i32* %e
	store i32 11, i32* @global1
	store i32 5, i32* @global1
	store i32 9, i32* @global1
	%u148 = load i32, i32* %a
	%u149 = load i32, i32* %b
	%u150 = add i32 %u148, %u149
	%u151 = load i32, i32* %c
	%u152 = add i32 %u150, %u151
	%u153 = load i32, i32* %d
	%u154 = add i32 %u152, %u153
	%u155 = load i32, i32* %e
	%u156 = add i32 %u154, %u155
	store i32 %u156, i32* %_retval_
	br label %bb4

bb4:
	%u157 = load i32, i32* %_retval_
	ret i32 %u157
}

define i32 @sum(i32 %number)
{

bb7:
	%_retval_ = alloca i32
	%_P_number = alloca i32
	%total = alloca i32
	store i32 %number, i32* %_P_number
	store i32 0, i32* %total
	br label %bb8

bb8:
	%u158 = load i32, i32* %_P_number
	%u159 = icmp sgt i32 %u158, 0
	%u160 = zext i1 %u159 to i32
	%u166 = trunc i32 %u160 to i1
	br i1 %u166, label %bb9, label %bb10

bb9:
	%u161 = load i32, i32* %total
	%u162 = load i32, i32* %_P_number
	%u163 = add i32 %u161, %u162
	store i32 %u163, i32* %total
	%u164 = load i32, i32* %_P_number
	%u165 = sub i32 %u164, 1
	store i32 %u165, i32* %_P_number
	br label %bb8

bb10:
	%u167 = load i32, i32* %total
	store i32 %u167, i32* %_retval_
	br label %bb6

bb6:
	%u168 = load i32, i32* %_retval_
	ret i32 %u168
}

define i32 @doesntModifyGlobals()
{

bb12:
	%_retval_ = alloca i32
	%a = alloca i32
	%b = alloca i32
	store i32 1, i32* %a
	store i32 2, i32* %b
	%u169 = load i32, i32* %a
	%u170 = load i32, i32* %b
	%u171 = add i32 %u169, %u170
	store i32 %u171, i32* %_retval_
	br label %bb11

bb11:
	%u172 = load i32, i32* %_retval_
	ret i32 %u172
}

define i32 @interProceduralOptimization()
{

bb14:
	%_retval_ = alloca i32
	%a = alloca i32
	store i32 1, i32* @global1
	store i32 0, i32* @global2
	store i32 0, i32* @global3
	%u173 = call i32 @sum(i32 100)
	store i32 %u173, i32* %a
	%u174 = load i32, i32* @global1
	%u175 = icmp eq i32 %u174, 1
	%u176 = zext i1 %u175 to i32
	%u177 = trunc i32 %u176 to i1
	br i1 %u177, label %bb15, label %bb16

bb15:
	%u178 = call i32 @sum(i32 10000)
	store i32 %u178, i32* %a
	br label %bb23

bb16:
	%u179 = load i32, i32* @global2
	%u180 = icmp eq i32 %u179, 2
	%u181 = zext i1 %u180 to i32
	%u182 = trunc i32 %u181 to i1
	br i1 %u182, label %bb17, label %bb18

bb17:
	%u183 = call i32 @sum(i32 20000)
	store i32 %u183, i32* %a
	br label %bb19

bb18:
	br label %bb19

bb19:
	%u184 = load i32, i32* @global3
	%u185 = icmp eq i32 %u184, 3
	%u186 = zext i1 %u185 to i32
	%u187 = trunc i32 %u186 to i1
	br i1 %u187, label %bb20, label %bb21

bb20:
	%u188 = call i32 @sum(i32 30000)
	store i32 %u188, i32* %a
	br label %bb22

bb21:
	br label %bb22

bb22:
	br label %bb23

bb23:
	%u189 = load i32, i32* %a
	store i32 %u189, i32* %_retval_
	br label %bb13

bb13:
	%u190 = load i32, i32* %_retval_
	ret i32 %u190
}

define i32 @commonSubexpressionElimination()
{

bb25:
	%_retval_ = alloca i32
	%a = alloca i32
	%b = alloca i32
	%c = alloca i32
	%d = alloca i32
	%e = alloca i32
	%f = alloca i32
	%g = alloca i32
	%h = alloca i32
	%i = alloca i32
	%j = alloca i32
	%k = alloca i32
	%l = alloca i32
	%m = alloca i32
	%n = alloca i32
	%o = alloca i32
	%p = alloca i32
	%q = alloca i32
	%r = alloca i32
	%s = alloca i32
	%t = alloca i32
	%u = alloca i32
	%v = alloca i32
	%w = alloca i32
	%x = alloca i32
	%y = alloca i32
	%z = alloca i32
	store i32 11, i32* %a
	store i32 22, i32* %b
	store i32 33, i32* %c
	store i32 44, i32* %d
	store i32 55, i32* %e
	store i32 66, i32* %f
	store i32 77, i32* %g
	%u191 = load i32, i32* %a
	%u192 = load i32, i32* %b
	%u193 = mul i32 %u191, %u192
	store i32 %u193, i32* %h
	%u194 = load i32, i32* %c
	%u195 = load i32, i32* %d
	%u196 = sdiv i32 %u194, %u195
	store i32 %u196, i32* %i
	%u197 = load i32, i32* %e
	%u198 = load i32, i32* %f
	%u199 = mul i32 %u197, %u198
	store i32 %u199, i32* %j
	%u200 = load i32, i32* %a
	%u201 = load i32, i32* %b
	%u202 = mul i32 %u200, %u201
	%u203 = load i32, i32* %c
	%u204 = load i32, i32* %d
	%u205 = sdiv i32 %u203, %u204
	%u206 = add i32 %u202, %u205
	%u207 = load i32, i32* %e
	%u208 = load i32, i32* %f
	%u209 = mul i32 %u207, %u208
	%u210 = sub i32 %u206, %u209
	%u211 = load i32, i32* %g
	%u212 = add i32 %u210, %u211
	store i32 %u212, i32* %k
	%u213 = load i32, i32* %a
	%u214 = load i32, i32* %b
	%u215 = mul i32 %u213, %u214
	%u216 = load i32, i32* %c
	%u217 = load i32, i32* %d
	%u218 = sdiv i32 %u216, %u217
	%u219 = add i32 %u215, %u218
	%u220 = load i32, i32* %e
	%u221 = load i32, i32* %f
	%u222 = mul i32 %u220, %u221
	%u223 = sub i32 %u219, %u222
	%u224 = load i32, i32* %g
	%u225 = add i32 %u223, %u224
	store i32 %u225, i32* %l
	%u226 = load i32, i32* %a
	%u227 = load i32, i32* %b
	%u228 = mul i32 %u226, %u227
	%u229 = load i32, i32* %c
	%u230 = load i32, i32* %d
	%u231 = sdiv i32 %u229, %u230
	%u232 = add i32 %u228, %u231
	%u233 = load i32, i32* %e
	%u234 = load i32, i32* %f
	%u235 = mul i32 %u233, %u234
	%u236 = sub i32 %u232, %u235
	%u237 = load i32, i32* %g
	%u238 = add i32 %u236, %u237
	store i32 %u238, i32* %m
	%u239 = load i32, i32* %a
	%u240 = load i32, i32* %b
	%u241 = mul i32 %u239, %u240
	%u242 = load i32, i32* %c
	%u243 = load i32, i32* %d
	%u244 = sdiv i32 %u242, %u243
	%u245 = add i32 %u241, %u244
	%u246 = load i32, i32* %e
	%u247 = load i32, i32* %f
	%u248 = mul i32 %u246, %u247
	%u249 = sub i32 %u245, %u248
	%u250 = load i32, i32* %g
	%u251 = add i32 %u249, %u250
	store i32 %u251, i32* %n
	%u252 = load i32, i32* %a
	%u253 = load i32, i32* %b
	%u254 = mul i32 %u252, %u253
	%u255 = load i32, i32* %c
	%u256 = load i32, i32* %d
	%u257 = sdiv i32 %u255, %u256
	%u258 = add i32 %u254, %u257
	%u259 = load i32, i32* %e
	%u260 = load i32, i32* %f
	%u261 = mul i32 %u259, %u260
	%u262 = sub i32 %u258, %u261
	%u263 = load i32, i32* %g
	%u264 = add i32 %u262, %u263
	store i32 %u264, i32* %o
	%u265 = load i32, i32* %a
	%u266 = load i32, i32* %b
	%u267 = mul i32 %u265, %u266
	%u268 = load i32, i32* %c
	%u269 = load i32, i32* %d
	%u270 = sdiv i32 %u268, %u269
	%u271 = add i32 %u267, %u270
	%u272 = load i32, i32* %e
	%u273 = load i32, i32* %f
	%u274 = mul i32 %u272, %u273
	%u275 = sub i32 %u271, %u274
	%u276 = load i32, i32* %g
	%u277 = add i32 %u275, %u276
	store i32 %u277, i32* %p
	%u278 = load i32, i32* %a
	%u279 = load i32, i32* %b
	%u280 = mul i32 %u278, %u279
	%u281 = load i32, i32* %c
	%u282 = load i32, i32* %d
	%u283 = sdiv i32 %u281, %u282
	%u284 = add i32 %u280, %u283
	%u285 = load i32, i32* %e
	%u286 = load i32, i32* %f
	%u287 = mul i32 %u285, %u286
	%u288 = sub i32 %u284, %u287
	%u289 = load i32, i32* %g
	%u290 = add i32 %u288, %u289
	store i32 %u290, i32* %q
	%u291 = load i32, i32* %a
	%u292 = load i32, i32* %b
	%u293 = mul i32 %u291, %u292
	%u294 = load i32, i32* %c
	%u295 = load i32, i32* %d
	%u296 = sdiv i32 %u294, %u295
	%u297 = add i32 %u293, %u296
	%u298 = load i32, i32* %e
	%u299 = load i32, i32* %f
	%u300 = mul i32 %u298, %u299
	%u301 = sub i32 %u297, %u300
	%u302 = load i32, i32* %g
	%u303 = add i32 %u301, %u302
	store i32 %u303, i32* %r
	%u304 = load i32, i32* %a
	%u305 = load i32, i32* %b
	%u306 = mul i32 %u304, %u305
	%u307 = load i32, i32* %c
	%u308 = load i32, i32* %d
	%u309 = sdiv i32 %u307, %u308
	%u310 = add i32 %u306, %u309
	%u311 = load i32, i32* %e
	%u312 = load i32, i32* %f
	%u313 = mul i32 %u311, %u312
	%u314 = sub i32 %u310, %u313
	%u315 = load i32, i32* %g
	%u316 = add i32 %u314, %u315
	store i32 %u316, i32* %s
	%u317 = load i32, i32* %a
	%u318 = load i32, i32* %b
	%u319 = mul i32 %u317, %u318
	%u320 = load i32, i32* %c
	%u321 = load i32, i32* %d
	%u322 = sdiv i32 %u320, %u321
	%u323 = add i32 %u319, %u322
	%u324 = load i32, i32* %e
	%u325 = load i32, i32* %f
	%u326 = mul i32 %u324, %u325
	%u327 = sub i32 %u323, %u326
	%u328 = load i32, i32* %g
	%u329 = add i32 %u327, %u328
	store i32 %u329, i32* %t
	%u330 = load i32, i32* %a
	%u331 = load i32, i32* %b
	%u332 = mul i32 %u330, %u331
	%u333 = load i32, i32* %c
	%u334 = load i32, i32* %d
	%u335 = sdiv i32 %u333, %u334
	%u336 = add i32 %u332, %u335
	%u337 = load i32, i32* %e
	%u338 = load i32, i32* %f
	%u339 = mul i32 %u337, %u338
	%u340 = sub i32 %u336, %u339
	%u341 = load i32, i32* %g
	%u342 = add i32 %u340, %u341
	store i32 %u342, i32* %u
	%u343 = load i32, i32* %b
	%u344 = load i32, i32* %a
	%u345 = mul i32 %u343, %u344
	%u346 = load i32, i32* %c
	%u347 = load i32, i32* %d
	%u348 = sdiv i32 %u346, %u347
	%u349 = add i32 %u345, %u348
	%u350 = load i32, i32* %e
	%u351 = load i32, i32* %f
	%u352 = mul i32 %u350, %u351
	%u353 = sub i32 %u349, %u352
	%u354 = load i32, i32* %g
	%u355 = add i32 %u353, %u354
	store i32 %u355, i32* %v
	%u356 = load i32, i32* %a
	%u357 = load i32, i32* %b
	%u358 = mul i32 %u356, %u357
	%u359 = load i32, i32* %c
	%u360 = load i32, i32* %d
	%u361 = sdiv i32 %u359, %u360
	%u362 = add i32 %u358, %u361
	%u363 = load i32, i32* %f
	%u364 = load i32, i32* %e
	%u365 = mul i32 %u363, %u364
	%u366 = sub i32 %u362, %u365
	%u367 = load i32, i32* %g
	%u368 = add i32 %u366, %u367
	store i32 %u368, i32* %w
	%u369 = load i32, i32* %g
	%u370 = load i32, i32* %a
	%u371 = load i32, i32* %b
	%u372 = mul i32 %u370, %u371
	%u373 = add i32 %u369, %u372
	%u374 = load i32, i32* %c
	%u375 = load i32, i32* %d
	%u376 = sdiv i32 %u374, %u375
	%u377 = add i32 %u373, %u376
	%u378 = load i32, i32* %e
	%u379 = load i32, i32* %f
	%u380 = mul i32 %u378, %u379
	%u381 = sub i32 %u377, %u380
	store i32 %u381, i32* %x
	%u382 = load i32, i32* %a
	%u383 = load i32, i32* %b
	%u384 = mul i32 %u382, %u383
	%u385 = load i32, i32* %c
	%u386 = load i32, i32* %d
	%u387 = sdiv i32 %u385, %u386
	%u388 = add i32 %u384, %u387
	%u389 = load i32, i32* %e
	%u390 = load i32, i32* %f
	%u391 = mul i32 %u389, %u390
	%u392 = sub i32 %u388, %u391
	%u393 = load i32, i32* %g
	%u394 = add i32 %u392, %u393
	store i32 %u394, i32* %y
	%u395 = load i32, i32* %c
	%u396 = load i32, i32* %d
	%u397 = sdiv i32 %u395, %u396
	%u398 = load i32, i32* %a
	%u399 = load i32, i32* %b
	%u400 = mul i32 %u398, %u399
	%u401 = add i32 %u397, %u400
	%u402 = load i32, i32* %e
	%u403 = load i32, i32* %f
	%u404 = mul i32 %u402, %u403
	%u405 = sub i32 %u401, %u404
	%u406 = load i32, i32* %g
	%u407 = add i32 %u405, %u406
	store i32 %u407, i32* %z
	%u408 = load i32, i32* %a
	%u409 = load i32, i32* %b
	%u410 = add i32 %u408, %u409
	%u411 = load i32, i32* %c
	%u412 = add i32 %u410, %u411
	%u413 = load i32, i32* %d
	%u414 = add i32 %u412, %u413
	%u415 = load i32, i32* %e
	%u416 = add i32 %u414, %u415
	%u417 = load i32, i32* %f
	%u418 = add i32 %u416, %u417
	%u419 = load i32, i32* %g
	%u420 = add i32 %u418, %u419
	%u421 = load i32, i32* %h
	%u422 = add i32 %u420, %u421
	%u423 = load i32, i32* %i
	%u424 = add i32 %u422, %u423
	%u425 = load i32, i32* %j
	%u426 = add i32 %u424, %u425
	%u427 = load i32, i32* %k
	%u428 = add i32 %u426, %u427
	%u429 = load i32, i32* %l
	%u430 = add i32 %u428, %u429
	%u431 = load i32, i32* %m
	%u432 = add i32 %u430, %u431
	%u433 = load i32, i32* %n
	%u434 = add i32 %u432, %u433
	%u435 = load i32, i32* %o
	%u436 = add i32 %u434, %u435
	%u437 = load i32, i32* %p
	%u438 = add i32 %u436, %u437
	%u439 = load i32, i32* %q
	%u440 = add i32 %u438, %u439
	%u441 = load i32, i32* %r
	%u442 = add i32 %u440, %u441
	%u443 = load i32, i32* %s
	%u444 = add i32 %u442, %u443
	%u445 = load i32, i32* %t
	%u446 = add i32 %u444, %u445
	%u447 = load i32, i32* %u
	%u448 = add i32 %u446, %u447
	%u449 = load i32, i32* %v
	%u450 = add i32 %u448, %u449
	%u451 = load i32, i32* %w
	%u452 = add i32 %u450, %u451
	%u453 = load i32, i32* %x
	%u454 = add i32 %u452, %u453
	%u455 = load i32, i32* %y
	%u456 = add i32 %u454, %u455
	%u457 = load i32, i32* %z
	%u458 = add i32 %u456, %u457
	store i32 %u458, i32* %_retval_
	br label %bb24

bb24:
	%u459 = load i32, i32* %_retval_
	ret i32 %u459
}

define i32 @hoisting()
{

bb27:
	%_retval_ = alloca i32
	%a = alloca i32
	%b = alloca i32
	%c = alloca i32
	%d = alloca i32
	%e = alloca i32
	%f = alloca i32
	%g = alloca i32
	%h = alloca i32
	%i = alloca i32
	store i32 1, i32* %a
	store i32 2, i32* %b
	store i32 3, i32* %c
	store i32 4, i32* %d
	store i32 0, i32* %i
	br label %bb28

bb28:
	%u460 = load i32, i32* %i
	%u461 = icmp slt i32 %u460, 1000000
	%u462 = zext i1 %u461 to i32
	%u475 = trunc i32 %u462 to i1
	br i1 %u475, label %bb29, label %bb30

bb29:
	store i32 5, i32* %e
	%u463 = load i32, i32* %a
	%u464 = load i32, i32* %b
	%u465 = add i32 %u463, %u464
	%u466 = load i32, i32* %c
	%u467 = add i32 %u465, %u466
	store i32 %u467, i32* %g
	%u468 = load i32, i32* %c
	%u469 = load i32, i32* %d
	%u470 = add i32 %u468, %u469
	%u471 = load i32, i32* %g
	%u472 = add i32 %u470, %u471
	store i32 %u472, i32* %h
	%u473 = load i32, i32* %i
	%u474 = add i32 %u473, 1
	store i32 %u474, i32* %i
	br label %bb28

bb30:
	%u476 = load i32, i32* %b
	store i32 %u476, i32* %_retval_
	br label %bb26

bb26:
	%u477 = load i32, i32* %_retval_
	ret i32 %u477
}

define i32 @doubleIf()
{

bb32:
	%_retval_ = alloca i32
	%a = alloca i32
	%b = alloca i32
	%c = alloca i32
	%d = alloca i32
	store i32 1, i32* %a
	store i32 2, i32* %b
	store i32 3, i32* %c
	store i32 0, i32* %d
	%u478 = load i32, i32* %a
	%u479 = icmp eq i32 %u478, 1
	%u480 = zext i1 %u479 to i32
	%u481 = trunc i32 %u480 to i1
	br i1 %u481, label %bb33, label %bb34

bb33:
	store i32 20, i32* %b
	%u482 = load i32, i32* %a
	%u483 = icmp eq i32 %u482, 1
	%u484 = zext i1 %u483 to i32
	%u485 = trunc i32 %u484 to i1
	br i1 %u485, label %bb35, label %bb36

bb34:
	br label %bb38

bb35:
	store i32 200, i32* %b
	store i32 300, i32* %c
	br label %bb37

bb36:
	store i32 1, i32* %a
	store i32 2, i32* %b
	store i32 3, i32* %c
	br label %bb37

bb37:
	store i32 50, i32* %d
	br label %bb38

bb38:
	%u486 = load i32, i32* %d
	store i32 %u486, i32* %_retval_
	br label %bb31

bb31:
	%u487 = load i32, i32* %_retval_
	ret i32 %u487
}

define i32 @integerDivide()
{

bb40:
	%_retval_ = alloca i32
	%a = alloca i32
	store i32 3000, i32* %a
	%u488 = load i32, i32* %a
	%u489 = sdiv i32 %u488, 2
	store i32 %u489, i32* %a
	%u490 = load i32, i32* %a
	%u491 = mul i32 %u490, 4
	store i32 %u491, i32* %a
	%u492 = load i32, i32* %a
	%u493 = sdiv i32 %u492, 8
	store i32 %u493, i32* %a
	%u494 = load i32, i32* %a
	%u495 = sdiv i32 %u494, 16
	store i32 %u495, i32* %a
	%u496 = load i32, i32* %a
	%u497 = mul i32 %u496, 32
	store i32 %u497, i32* %a
	%u498 = load i32, i32* %a
	%u499 = sdiv i32 %u498, 64
	store i32 %u499, i32* %a
	%u500 = load i32, i32* %a
	%u501 = mul i32 %u500, 128
	store i32 %u501, i32* %a
	%u502 = load i32, i32* %a
	%u503 = sdiv i32 %u502, 4
	store i32 %u503, i32* %a
	%u504 = load i32, i32* %a
	store i32 %u504, i32* %_retval_
	br label %bb39

bb39:
	%u505 = load i32, i32* %_retval_
	ret i32 %u505
}

define i32 @association()
{

bb42:
	%_retval_ = alloca i32
	%a = alloca i32
	store i32 10, i32* %a
	%u506 = load i32, i32* %a
	%u507 = mul i32 %u506, 2
	store i32 %u507, i32* %a
	%u508 = load i32, i32* %a
	%u509 = sdiv i32 %u508, 2
	store i32 %u509, i32* %a
	%u510 = load i32, i32* %a
	%u511 = mul i32 3, %u510
	store i32 %u511, i32* %a
	%u512 = load i32, i32* %a
	%u513 = sdiv i32 %u512, 3
	store i32 %u513, i32* %a
	%u514 = load i32, i32* %a
	%u515 = mul i32 %u514, 4
	store i32 %u515, i32* %a
	%u516 = load i32, i32* %a
	%u517 = sdiv i32 %u516, 4
	store i32 %u517, i32* %a
	%u518 = load i32, i32* %a
	%u519 = add i32 %u518, 4
	store i32 %u519, i32* %a
	%u520 = load i32, i32* %a
	%u521 = sub i32 %u520, 4
	store i32 %u521, i32* %a
	%u522 = load i32, i32* %a
	%u523 = mul i32 %u522, 50
	store i32 %u523, i32* %a
	%u524 = load i32, i32* %a
	%u525 = sdiv i32 %u524, 50
	store i32 %u525, i32* %a
	%u526 = load i32, i32* %a
	store i32 %u526, i32* %_retval_
	br label %bb41

bb41:
	%u527 = load i32, i32* %_retval_
	ret i32 %u527
}

define i32 @tailRecursionHelper(i32 %value, i32 %sum)
{

bb44:
	%_retval_ = alloca i32
	%_P_value = alloca i32
	%_P_sum = alloca i32
	store i32 %value, i32* %_P_value
	store i32 %sum, i32* %_P_sum
	%u528 = load i32, i32* %_P_value
	%u529 = icmp eq i32 %u528, 0
	%u530 = zext i1 %u529 to i32
	%u531 = trunc i32 %u530 to i1
	br i1 %u531, label %bb45, label %bb46

bb45:
	%u532 = load i32, i32* %_P_sum
	store i32 %u532, i32* %_retval_
	br label %bb43

bb46:
	%u533 = load i32, i32* %_P_value
	%u534 = sub i32 %u533, 1
	%u535 = load i32, i32* %_P_sum
	%u536 = load i32, i32* %_P_value
	%u537 = add i32 %u535, %u536
	%u538 = call i32 @tailRecursionHelper(i32 %u534, i32 %u537)
	store i32 %u538, i32* %_retval_
	br label %bb43

bb43:
	%u539 = load i32, i32* %_retval_
	ret i32 %u539
}

define i32 @tailRecursion(i32 %value)
{

bb48:
	%_retval_ = alloca i32
	%_P_value = alloca i32
	store i32 %value, i32* %_P_value
	%u540 = load i32, i32* %_P_value
	%u541 = call i32 @tailRecursionHelper(i32 %u540, i32 0)
	store i32 %u541, i32* %_retval_
	br label %bb47

bb47:
	%u542 = load i32, i32* %_retval_
	ret i32 %u542
}

define i32 @unswitching()
{

bb50:
	%_retval_ = alloca i32
	%a = alloca i32
	%b = alloca i32
	store i32 1, i32* %a
	store i32 2, i32* %b
	br label %bb51

bb51:
	%u543 = load i32, i32* %a
	%u544 = icmp slt i32 %u543, 1000000
	%u545 = zext i1 %u544 to i32
	%u554 = trunc i32 %u545 to i1
	br i1 %u554, label %bb52, label %bb56

bb52:
	%u546 = load i32, i32* %b
	%u547 = icmp eq i32 %u546, 2
	%u548 = zext i1 %u547 to i32
	%u549 = trunc i32 %u548 to i1
	br i1 %u549, label %bb53, label %bb54

bb53:
	%u550 = load i32, i32* %a
	%u551 = add i32 %u550, 1
	store i32 %u551, i32* %a
	br label %bb55

bb54:
	%u552 = load i32, i32* %a
	%u553 = add i32 %u552, 2
	store i32 %u553, i32* %a
	br label %bb55

bb55:
	br label %bb51

bb56:
	%u555 = load i32, i32* %a
	store i32 %u555, i32* %_retval_
	br label %bb49

bb49:
	%u556 = load i32, i32* %_retval_
	ret i32 %u556
}

define i32 @randomCalculation(i32 %number)
{

bb58:
	%_retval_ = alloca i32
	%_P_number = alloca i32
	%a = alloca i32
	%b = alloca i32
	%c = alloca i32
	%d = alloca i32
	%e = alloca i32
	%i = alloca i32
	%sum = alloca i32
	store i32 %number, i32* %_P_number
	store i32 0, i32* %i
	store i32 0, i32* %sum
	br label %bb59

bb59:
	%u557 = load i32, i32* %i
	%u558 = load i32, i32* %_P_number
	%u559 = icmp slt i32 %u557, %u558
	%u560 = zext i1 %u559 to i32
	%u584 = trunc i32 %u560 to i1
	br i1 %u584, label %bb60, label %bb61

bb60:
	store i32 4, i32* %a
	store i32 7, i32* %b
	store i32 8, i32* %c
	%u561 = load i32, i32* %a
	%u562 = load i32, i32* %b
	%u563 = add i32 %u561, %u562
	store i32 %u563, i32* %d
	%u564 = load i32, i32* %d
	%u565 = load i32, i32* %c
	%u566 = add i32 %u564, %u565
	store i32 %u566, i32* %e
	%u567 = load i32, i32* %sum
	%u568 = load i32, i32* %e
	%u569 = add i32 %u567, %u568
	store i32 %u569, i32* %sum
	%u570 = load i32, i32* %i
	%u571 = mul i32 %u570, 2
	store i32 %u571, i32* %i
	%u572 = load i32, i32* %i
	%u573 = sdiv i32 %u572, 2
	store i32 %u573, i32* %i
	%u574 = load i32, i32* %i
	%u575 = mul i32 3, %u574
	store i32 %u575, i32* %i
	%u576 = load i32, i32* %i
	%u577 = sdiv i32 %u576, 3
	store i32 %u577, i32* %i
	%u578 = load i32, i32* %i
	%u579 = mul i32 %u578, 4
	store i32 %u579, i32* %i
	%u580 = load i32, i32* %i
	%u581 = sdiv i32 %u580, 4
	store i32 %u581, i32* %i
	%u582 = load i32, i32* %i
	%u583 = add i32 %u582, 1
	store i32 %u583, i32* %i
	br label %bb59

bb61:
	%u585 = load i32, i32* %sum
	store i32 %u585, i32* %_retval_
	br label %bb57

bb57:
	%u586 = load i32, i32* %_retval_
	ret i32 %u586
}

define i32 @iterativeFibonacci(i32 %number)
{

bb63:
	%_retval_ = alloca i32
	%_P_number = alloca i32
	%previous = alloca i32
	%result = alloca i32
	%count = alloca i32
	%i = alloca i32
	%sum = alloca i32
	store i32 %number, i32* %_P_number
	store i32 -1, i32* %previous
	store i32 1, i32* %result
	store i32 0, i32* %i
	br label %bb64

bb64:
	%u587 = load i32, i32* %i
	%u588 = load i32, i32* %_P_number
	%u589 = icmp slt i32 %u587, %u588
	%u590 = zext i1 %u589 to i32
	%u598 = trunc i32 %u590 to i1
	br i1 %u598, label %bb65, label %bb66

bb65:
	%u591 = load i32, i32* %result
	%u592 = load i32, i32* %previous
	%u593 = add i32 %u591, %u592
	store i32 %u593, i32* %sum
	%u594 = load i32, i32* %result
	store i32 %u594, i32* %previous
	%u595 = load i32, i32* %sum
	store i32 %u595, i32* %result
	%u596 = load i32, i32* %i
	%u597 = add i32 %u596, 1
	store i32 %u597, i32* %i
	br label %bb64

bb66:
	%u599 = load i32, i32* %result
	store i32 %u599, i32* %_retval_
	br label %bb62

bb62:
	%u600 = load i32, i32* %_retval_
	ret i32 %u600
}

define i32 @recursiveFibonacci(i32 %number)
{

bb68:
	%_retval_ = alloca i32
	%_P_number = alloca i32
	store i32 %number, i32* %_P_number
	%u601 = load i32, i32* %_P_number
	%u602 = icmp sle i32 %u601, 0
	%u603 = zext i1 %u602 to i32
	%u604 = load i32, i32* %_P_number
	%u605 = icmp eq i32 %u604, 1
	%u606 = zext i1 %u605 to i32
	%u607 = or i32 %u603, %u606
	%u608 = trunc i32 %u607 to i1
	br i1 %u608, label %bb69, label %bb70

bb69:
	%u609 = load i32, i32* %_P_number
	store i32 %u609, i32* %_retval_
	br label %bb67

bb70:
	%u610 = load i32, i32* %_P_number
	%u611 = sub i32 %u610, 1
	%u612 = call i32 @recursiveFibonacci(i32 %u611)
	%u613 = load i32, i32* %_P_number
	%u614 = sub i32 %u613, 2
	%u615 = call i32 @recursiveFibonacci(i32 %u614)
	%u616 = add i32 %u612, %u615
	store i32 %u616, i32* %_retval_
	br label %bb67

bb67:
	%u617 = load i32, i32* %_retval_
	ret i32 %u617
}

define i32 @main()
{

bb72:
	%_retval_ = alloca i32
	%input = alloca i32
	%result = alloca i32
	%i = alloca i32
	%u618 = call i32 @read_helper()
	store i32 %u618, i32* %input
	store i32 1, i32* %i
	br label %bb73

bb73:
	%u619 = load i32, i32* %i
	%u620 = load i32, i32* %input
	%u621 = icmp slt i32 %u619, %u620
	%u622 = zext i1 %u621 to i32
	%u674 = trunc i32 %u622 to i1
	br i1 %u674, label %bb74, label %bb75

bb74:
	%u623 = call i32 @constantFolding()
	store i32 %u623, i32* %result
	%u624 = load i32, i32* %result
	%u625 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u625)
	%u626 = call i32 @constantPropagation()
	store i32 %u626, i32* %result
	%u627 = load i32, i32* %result
	%u628 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u628)
	%u629 = call i32 @deadCodeElimination()
	store i32 %u629, i32* %result
	%u630 = load i32, i32* %result
	%u631 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u631)
	%u632 = call i32 @interProceduralOptimization()
	store i32 %u632, i32* %result
	%u633 = load i32, i32* %result
	%u634 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u634)
	%u635 = call i32 @commonSubexpressionElimination()
	store i32 %u635, i32* %result
	%u636 = load i32, i32* %result
	%u637 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u637)
	%u638 = call i32 @hoisting()
	store i32 %u638, i32* %result
	%u639 = load i32, i32* %result
	%u640 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u640)
	%u641 = call i32 @doubleIf()
	store i32 %u641, i32* %result
	%u642 = load i32, i32* %result
	%u643 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u643)
	%u644 = call i32 @integerDivide()
	store i32 %u644, i32* %result
	%u645 = load i32, i32* %result
	%u646 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u646)
	%u647 = call i32 @association()
	store i32 %u647, i32* %result
	%u648 = load i32, i32* %result
	%u649 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u649)
	%u650 = load i32, i32* %input
	%u651 = sdiv i32 %u650, 1000
	%u652 = call i32 @tailRecursion(i32 %u651)
	store i32 %u652, i32* %result
	%u653 = load i32, i32* %result
	%u654 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u654)
	%u655 = call i32 @unswitching()
	store i32 %u655, i32* %result
	%u656 = load i32, i32* %result
	%u657 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u657)
	%u658 = load i32, i32* %input
	%u659 = call i32 @randomCalculation(i32 %u658)
	store i32 %u659, i32* %result
	%u660 = load i32, i32* %result
	%u661 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u661)
	%u662 = load i32, i32* %input
	%u663 = sdiv i32 %u662, 5
	%u664 = call i32 @iterativeFibonacci(i32 %u663)
	store i32 %u664, i32* %result
	%u665 = load i32, i32* %result
	%u666 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u666)
	%u667 = load i32, i32* %input
	%u668 = sdiv i32 %u667, 1000
	%u669 = call i32 @recursiveFibonacci(i32 %u668)
	store i32 %u669, i32* %result
	%u670 = load i32, i32* %result
	%u671 = load i32, i32* %result
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %u671)
	%u672 = load i32, i32* %i
	%u673 = add i32 %u672, 1
	store i32 %u673, i32* %i
	br label %bb73

bb75:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 9999)
	store i32 0, i32* %_retval_
	br label %bb71

bb71:
	%u675 = load i32, i32* %_retval_
	ret i32 %u675
}

declare i8* @malloc_helper(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @read_helper()
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1

