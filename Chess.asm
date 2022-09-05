		.DATA
pawn_sprite 		.FILL #0
		.FILL #896
		.FILL #1984
		.FILL #4064
		.FILL #4064
		.FILL #4064
		.FILL #1984
		.FILL #896
		.FILL #896
		.FILL #896
		.FILL #896
		.FILL #896
		.FILL #4064
		.FILL #8176
		.FILL #16376
		.DATA
rook_sprite 		.FILL #0
		.FILL #13208
		.FILL #13208
		.FILL #8176
		.FILL #8176
		.FILL #4064
		.FILL #1984
		.FILL #1984
		.FILL #1984
		.FILL #1984
		.FILL #1984
		.FILL #1984
		.FILL #4064
		.FILL #8176
		.FILL #16376
		.DATA
knight_sprite 		.FILL #0
		.FILL #2048
		.FILL #3840
		.FILL #7552
		.FILL #8128
		.FILL #16352
		.FILL #16352
		.FILL #15872
		.FILL #15872
		.FILL #16256
		.FILL #8128
		.FILL #4064
		.FILL #4064
		.FILL #16376
		.FILL #32764
		.DATA
bishop_sprite 		.FILL #0
		.FILL #256
		.FILL #896
		.FILL #256
		.FILL #896
		.FILL #1728
		.FILL #3168
		.FILL #3808
		.FILL #1984
		.FILL #896
		.FILL #896
		.FILL #896
		.FILL #1984
		.FILL #4064
		.FILL #8176
		.DATA
queen_sprite 		.FILL #256
		.FILL #896
		.FILL #4368
		.FILL #7088
		.FILL #8176
		.FILL #4064
		.FILL #1984
		.FILL #4064
		.FILL #896
		.FILL #896
		.FILL #896
		.FILL #896
		.FILL #4064
		.FILL #8176
		.FILL #16376
		.DATA
king_sprite 		.FILL #256
		.FILL #896
		.FILL #256
		.FILL #1984
		.FILL #4064
		.FILL #4064
		.FILL #1984
		.FILL #896
		.FILL #896
		.FILL #896
		.FILL #896
		.FILL #1984
		.FILL #4064
		.FILL #8176
		.FILL #16376
		.DATA
board_state 		.FILL #10
		.FILL #11
		.FILL #12
		.FILL #13
		.FILL #14
		.FILL #12
		.FILL #11
		.FILL #10
		.FILL #9
		.FILL #9
		.FILL #9
		.FILL #9
		.FILL #9
		.FILL #9
		.FILL #9
		.FILL #9
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #0
		.FILL #1
		.FILL #1
		.FILL #1
		.FILL #1
		.FILL #1
		.FILL #1
		.FILL #1
		.FILL #1
		.FILL #2
		.FILL #3
		.FILL #4
		.FILL #5
		.FILL #6
		.FILL #4
		.FILL #3
		.FILL #2
		.DATA
player_to_move 		.FILL #1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;abs;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
abs
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-1	;; allocate stack space for local variables
	;; function body
	LDR R7, R5, #3
	CONST R3, #0
	CMP R7, R3
	BRn L4_Chess
	LDR R7, R5, #3
	STR R7, R5, #-1
	JMP L5_Chess
L4_Chess
	LDR R7, R5, #3
	NOT R7,R7
	ADD R7,R7,#1
	STR R7, R5, #-1
L5_Chess
	LDR R7, R5, #-1
L2_Chess
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;max;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
max
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-1	;; allocate stack space for local variables
	;; function body
	LDR R7, R5, #3
	LDR R3, R5, #4
	CMP R7, R3
	BRnz L8_Chess
	LDR R7, R5, #3
	STR R7, R5, #-1
	JMP L9_Chess
L8_Chess
	LDR R7, R5, #4
	STR R7, R5, #-1
L9_Chess
	LDR R7, R5, #-1
L6_Chess
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;printnum;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
printnum
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-13	;; allocate stack space for local variables
	;; function body
	LDR R7, R5, #3
	CONST R3, #0
	CMP R7, R3
	BRnp L11_Chess
	LEA R7, L13_Chess
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	JMP L10_Chess
L11_Chess
	LDR R7, R5, #3
	CONST R3, #0
	CMP R7, R3
	BRzp L15_Chess
	LDR R7, R5, #3
	NOT R7,R7
	ADD R7,R7,#1
	STR R7, R5, #-13
	JMP L16_Chess
L15_Chess
	LDR R7, R5, #3
	STR R7, R5, #-13
L16_Chess
	LDR R7, R5, #-13
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #0
	CMP R7, R3
	BRzp L17_Chess
	LEA R7, L19_Chess
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	JMP L10_Chess
L17_Chess
	ADD R7, R5, #-12
	ADD R7, R7, #10
	STR R7, R5, #-2
	LDR R7, R5, #-2
	ADD R7, R7, #-1
	STR R7, R5, #-2
	CONST R3, #0
	STR R3, R7, #0
	JMP L21_Chess
L20_Chess
	LDR R7, R5, #-2
	ADD R7, R7, #-1
	STR R7, R5, #-2
	LDR R3, R5, #-1
	CONST R2, #10
	MOD R3, R3, R2
	CONST R2, #48
	ADD R3, R3, R2
	STR R3, R7, #0
	LDR R7, R5, #-1
	CONST R3, #10
	DIV R7, R7, R3
	STR R7, R5, #-1
L21_Chess
	LDR R7, R5, #-1
	CONST R3, #0
	CMP R7, R3
	BRnp L20_Chess
	LDR R7, R5, #3
	CONST R3, #0
	CMP R7, R3
	BRzp L23_Chess
	LDR R7, R5, #-2
	ADD R7, R7, #-1
	STR R7, R5, #-2
	CONST R3, #45
	STR R3, R7, #0
L23_Chess
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
L10_Chess
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;endl;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
endl
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	LEA R7, L26_Chess
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
L25_Chess
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;get_ply;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
get_ply
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-5	;; allocate stack space for local variables
	;; function body
	LEA R7, ply
	CONST R3, #0
	STR R3, R7, #4
	JSR lc4_getc_echo
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #113
	CMP R7, R3
	BRnp L29_Chess
	CONST R7, #-2
	JMP L28_Chess
L29_Chess
	LDR R7, R5, #-1
	CONST R3, #120
	CMP R7, R3
	BRnp L31_Chess
	LEA R7, ply
	CONST R3, #1
	STR R3, R7, #4
	CONST R7, #1
	JMP L28_Chess
L31_Chess
	LDR R7, R5, #-1
	CONST R3, #121
	CMP R7, R3
	BRnp L33_Chess
	LEA R7, ply
	CONST R3, #2
	STR R3, R7, #4
	CONST R7, #1
	JMP L28_Chess
L33_Chess
	LDR R7, R5, #-1
	STR R7, R5, #-2
	CONST R3, #97
	CMP R7, R3
	BRn L37_Chess
	CONST R7, #104
	LDR R3, R5, #-2
	CMP R3, R7
	BRnz L35_Chess
L37_Chess
	CONST R7, #-1
	JMP L28_Chess
L35_Chess
	LEA R7, ply
	LDR R3, R5, #-1
	CONST R2, #97
	SUB R3, R3, R2
	STR R3, R7, #1
	JSR lc4_getc_echo
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #113
	CMP R7, R3
	BRnp L38_Chess
	CONST R7, #-2
	JMP L28_Chess
L38_Chess
	LDR R7, R5, #-1
	STR R7, R5, #-3
	CONST R3, #49
	CMP R7, R3
	BRn L42_Chess
	CONST R7, #56
	LDR R3, R5, #-3
	CMP R3, R7
	BRnz L40_Chess
L42_Chess
	CONST R7, #-1
	JMP L28_Chess
L40_Chess
	LEA R7, ply
	LDR R3, R5, #-1
	CONST R2, #49
	SUB R3, R3, R2
	STR R3, R7, #0
	JSR lc4_getc_echo
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #113
	CMP R7, R3
	BRnp L43_Chess
	CONST R7, #-2
	JMP L28_Chess
L43_Chess
	LDR R7, R5, #-1
	STR R7, R5, #-4
	CONST R3, #97
	CMP R7, R3
	BRn L47_Chess
	CONST R7, #104
	LDR R3, R5, #-4
	CMP R3, R7
	BRnz L45_Chess
L47_Chess
	CONST R7, #-1
	JMP L28_Chess
L45_Chess
	LEA R7, ply
	LDR R3, R5, #-1
	CONST R2, #97
	SUB R3, R3, R2
	STR R3, R7, #3
	JSR lc4_getc_echo
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #113
	CMP R7, R3
	BRnp L48_Chess
	CONST R7, #-2
	JMP L28_Chess
L48_Chess
	LDR R7, R5, #-1
	STR R7, R5, #-5
	CONST R3, #49
	CMP R7, R3
	BRn L52_Chess
	CONST R7, #56
	LDR R3, R5, #-5
	CMP R3, R7
	BRnz L50_Chess
L52_Chess
	CONST R7, #-1
	JMP L28_Chess
L50_Chess
	LEA R7, ply
	LDR R3, R5, #-1
	CONST R2, #49
	SUB R3, R3, R2
	STR R3, R7, #2
	CONST R7, #1
L28_Chess
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;draw_square;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
draw_square
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-9	;; allocate stack space for local variables
	;; function body
	CONST R7, #15
	LDR R3, R5, #3
	CONST R2, #7
	SUB R2, R2, R3
	MUL R2, R7, R2
	ADD R2, R2, #2
	STR R2, R5, #-3
	LDR R2, R5, #4
	MUL R7, R7, R2
	ADD R7, R7, #4
	STR R7, R5, #-4
	ADD R7, R3, R2
	AND R7, R7, #1
	CONST R3, #0
	CMP R7, R3
	BRz L55_Chess
	CONST R7, #8
	HICONST R7, #33
	STR R7, R5, #-8
	JMP L56_Chess
L55_Chess
	CONST R7, #0
	HICONST R7, #1
	STR R7, R5, #-8
L56_Chess
	LDR R7, R5, #-8
	STR R7, R5, #-5
	LDR R7, R5, #-5
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #15
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-3
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-4
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_rect
	ADD R6, R6, #5	;; free space for arguments
	LDR R7, R5, #4
	LDR R3, R5, #3
	SLL R3, R3, #3
	LEA R2, board_state
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	STR R7, R5, #-2
	LDR R7, R5, #-2
	CONST R3, #0
	CMP R7, R3
	BRz L57_Chess
	LDR R7, R5, #-2
	AND R3, R7, #7
	STR R3, R5, #-1
	AND R7, R7, #8
	CONST R3, #0
	CMP R7, R3
	BRz L60_Chess
	CONST R7, #255
	HICONST R7, #127
	STR R7, R5, #-9
	JMP L61_Chess
L60_Chess
	CONST R7, #0
	STR R7, R5, #-9
L61_Chess
	LDR R7, R5, #-9
	STR R7, R5, #-7
	LDR R7, R5, #-1
	CONST R3, #1
	CMP R7, R3
	BRnp L62_Chess
	LEA R7, pawn_sprite
	STR R7, R5, #-6
L62_Chess
	LDR R7, R5, #-1
	CONST R3, #2
	CMP R7, R3
	BRnp L64_Chess
	LEA R7, rook_sprite
	STR R7, R5, #-6
L64_Chess
	LDR R7, R5, #-1
	CONST R3, #3
	CMP R7, R3
	BRnp L66_Chess
	LEA R7, knight_sprite
	STR R7, R5, #-6
L66_Chess
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRnp L68_Chess
	LEA R7, bishop_sprite
	STR R7, R5, #-6
L68_Chess
	LDR R7, R5, #-1
	CONST R3, #5
	CMP R7, R3
	BRnp L70_Chess
	LEA R7, queen_sprite
	STR R7, R5, #-6
L70_Chess
	LDR R7, R5, #-1
	CONST R3, #6
	CMP R7, R3
	BRnp L72_Chess
	LEA R7, king_sprite
	STR R7, R5, #-6
L72_Chess
	LDR R7, R5, #-6
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-7
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-3
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-4
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L57_Chess
L53_Chess
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;draw_chessboard;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
draw_chessboard
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-2	;; allocate stack space for local variables
	;; function body
	CONST R7, #0
	STR R7, R5, #-2
L75_Chess
	CONST R7, #0
	STR R7, R5, #-1
L79_Chess
	LDR R7, R5, #-1
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_square
	ADD R6, R6, #2	;; free space for arguments
L80_Chess
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #8
	CMP R7, R3
	BRn L79_Chess
L76_Chess
	LDR R7, R5, #-2
	ADD R7, R7, #1
	STR R7, R5, #-2
	LDR R7, R5, #-2
	CONST R3, #8
	CMP R7, R3
	BRn L75_Chess
L74_Chess
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;is_legal_pawn_move;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
is_legal_pawn_move
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-4	;; allocate stack space for local variables
	;; function body
	LDR R7, R5, #7
	CONST R3, #0
	CMP R7, R3
	BRz L84_Chess
	LDR R7, R5, #5
	LDR R3, R5, #3
	CMP R7, R3
	BRp L85_Chess
	CONST R7, #0
	JMP L83_Chess
L84_Chess
	LDR R7, R5, #5
	LDR R3, R5, #3
	CMP R7, R3
	BRn L88_Chess
	CONST R7, #0
	JMP L83_Chess
L88_Chess
L85_Chess
	LDR R7, R5, #5
	LDR R3, R5, #3
	SUB R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR abs
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #1	;; free space for arguments
	STR R7, R5, #-2
	LDR R7, R5, #6
	LDR R3, R5, #4
	SUB R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR abs
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #1	;; free space for arguments
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #1
	CMP R7, R3
	BRnz L90_Chess
	CONST R7, #0
	JMP L83_Chess
L90_Chess
	LDR R7, R5, #-1
	CONST R3, #0
	CMP R7, R3
	BRz L92_Chess
	LDR R7, R5, #-2
	CONST R3, #1
	CMP R7, R3
	BRz L94_Chess
	CONST R7, #0
	JMP L83_Chess
L94_Chess
	LDR R7, R5, #6
	LDR R3, R5, #5
	SLL R3, R3, #3
	LEA R2, board_state
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	STR R7, R5, #-3
	LDR R7, R5, #-3
	CONST R3, #0
	CMP R7, R3
	BRz L96_Chess
	LDR R7, R5, #-3
	AND R7, R7, #8
	LDR R3, R5, #7
	CMP R7, R3
	BRnp L93_Chess
	CONST R7, #0
	JMP L83_Chess
L96_Chess
	CONST R7, #0
	JMP L83_Chess
L92_Chess
	LDR R7, R5, #-2
	CONST R3, #2
	CMP R7, R3
	BRnz L100_Chess
	CONST R7, #0
	JMP L83_Chess
L100_Chess
	LDR R7, R5, #6
	LDR R3, R5, #5
	SLL R3, R3, #3
	LEA R2, board_state
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRz L102_Chess
	CONST R7, #0
	JMP L83_Chess
L102_Chess
	LDR R7, R5, #-2
	CONST R3, #2
	CMP R7, R3
	BRnp L104_Chess
	LDR R7, R5, #3
	STR R7, R5, #-4
	CONST R3, #1
	CMP R7, R3
	BRz L108_Chess
	CONST R7, #6
	LDR R3, R5, #-4
	CMP R3, R7
	BRnp L106_Chess
L108_Chess
	CONST R7, #2
	LDR R3, R5, #6
	LDR R2, R5, #4
	ADD R3, R3, R2
	DIV R3, R3, R7
	LDR R2, R5, #5
	LDR R1, R5, #3
	ADD R2, R2, R1
	DIV R7, R2, R7
	SLL R7, R7, #3
	LEA R2, board_state
	ADD R7, R7, R2
	ADD R7, R3, R7
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRz L107_Chess
	CONST R7, #0
	JMP L83_Chess
L106_Chess
	CONST R7, #0
	JMP L83_Chess
L107_Chess
L104_Chess
L93_Chess
	LDR R7, R5, #5
	CONST R3, #0
	CMP R7, R3
	BRnp L111_Chess
	LDR R7, R5, #6
	LDR R3, R5, #5
	SLL R3, R3, #3
	LEA R2, board_state
	ADD R3, R3, R2
	ADD R7, R7, R3
	CONST R3, #5
	STR R3, R7, #0
L111_Chess
	LDR R7, R5, #5
	CONST R3, #7
	CMP R7, R3
	BRnp L113_Chess
	LDR R7, R5, #6
	LDR R3, R5, #5
	SLL R3, R3, #3
	LEA R2, board_state
	ADD R3, R3, R2
	ADD R7, R7, R3
	CONST R3, #13
	STR R3, R7, #0
L113_Chess
	CONST R7, #1
L83_Chess
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;is_legal_rook_move;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
is_legal_rook_move
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	CONST R7, #1
L115_Chess
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;is_legal_bishop_move;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
is_legal_bishop_move
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	CONST R7, #1
L116_Chess
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;is_legal_knight_move;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
is_legal_knight_move
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	CONST R7, #1
L117_Chess
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;is_legal_queen_move;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
is_legal_queen_move
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	CONST R7, #1
L118_Chess
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;is_legal_king_move;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
is_legal_king_move
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	CONST R7, #1
L119_Chess
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;is_legal_piece_move;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
is_legal_piece_move
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-5	;; allocate stack space for local variables
	;; function body
	LDR R7, R5, #3
	LDR R3, R5, #5
	CMP R7, R3
	BRnp L121_Chess
	LDR R7, R5, #4
	LDR R3, R5, #6
	CMP R7, R3
	BRnp L121_Chess
	CONST R7, #0
	JMP L120_Chess
L121_Chess
	LDR R7, R5, #4
	LDR R3, R5, #3
	SLL R3, R3, #3
	LEA R2, board_state
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	STR R7, R5, #-2
	LDR R7, R5, #-2
	CONST R3, #0
	CMP R7, R3
	BRnp L123_Chess
	CONST R7, #0
	JMP L120_Chess
L123_Chess
	LDR R7, R5, #-2
	AND R7, R7, #8
	STR R7, R5, #-4
	LDR R7, R5, #6
	LDR R3, R5, #5
	SLL R3, R3, #3
	LEA R2, board_state
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	STR R7, R5, #-3
	LDR R7, R5, #-3
	CONST R3, #0
	CMP R7, R3
	BRz L125_Chess
	LDR R7, R5, #-3
	AND R7, R7, #8
	STR R7, R5, #-5
	LDR R7, R5, #-4
	LDR R3, R5, #-5
	CMP R7, R3
	BRnp L127_Chess
	CONST R7, #0
	JMP L120_Chess
L127_Chess
L125_Chess
	LDR R7, R5, #-2
	AND R7, R7, #7
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #1
	CMP R7, R3
	BRnp L129_Chess
	LDR R7, R5, #-4
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #6
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR is_legal_pawn_move
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #5	;; free space for arguments
	JMP L120_Chess
L129_Chess
	LDR R7, R5, #-1
	CONST R3, #2
	CMP R7, R3
	BRnp L131_Chess
	LDR R7, R5, #6
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR is_legal_rook_move
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #4	;; free space for arguments
	JMP L120_Chess
L131_Chess
	LDR R7, R5, #-1
	CONST R3, #3
	CMP R7, R3
	BRnp L133_Chess
	LDR R7, R5, #6
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR is_legal_knight_move
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #4	;; free space for arguments
	JMP L120_Chess
L133_Chess
	LDR R7, R5, #-1
	CONST R3, #4
	CMP R7, R3
	BRnp L135_Chess
	LDR R7, R5, #6
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR is_legal_bishop_move
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #4	;; free space for arguments
	JMP L120_Chess
L135_Chess
	LDR R7, R5, #-1
	CONST R3, #5
	CMP R7, R3
	BRnp L137_Chess
	LDR R7, R5, #6
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR is_legal_queen_move
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #4	;; free space for arguments
	JMP L120_Chess
L137_Chess
	LDR R7, R5, #-1
	CONST R3, #6
	CMP R7, R3
	BRnp L139_Chess
	LDR R7, R5, #6
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR is_legal_king_move
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #4	;; free space for arguments
	JMP L120_Chess
L139_Chess
	CONST R7, #1
L120_Chess
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;is_king_in_check;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
is_king_in_check
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-4	;; allocate stack space for local variables
	;; function body
	CONST R7, #0
	STR R7, R5, #-3
	LDR R7, R5, #4
	LDR R3, R5, #3
	SLL R3, R3, #3
	LEA R2, board_state
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R3, R7, #0
	STR R3, R5, #-4
	CONST R3, #0
	STR R3, R7, #0
	LDR R7, R5, #6
	LDR R3, R5, #5
	SLL R3, R3, #3
	LEA R2, board_state
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R3, R5, #-4
	STR R3, R7, #0
	CONST R7, #0
	STR R7, R5, #-2
L142_Chess
	CONST R7, #0
	STR R7, R5, #-1
L146_Chess
	LDR R7, R5, #6
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR is_legal_piece_move
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #4	;; free space for arguments
	CONST R3, #0
	CMP R7, R3
	BRz L150_Chess
	CONST R7, #1
	STR R7, R5, #-3
L150_Chess
L147_Chess
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #8
	CMP R7, R3
	BRn L146_Chess
L143_Chess
	LDR R7, R5, #-2
	ADD R7, R7, #1
	STR R7, R5, #-2
	LDR R7, R5, #-2
	CONST R3, #8
	CMP R7, R3
	BRn L142_Chess
	LDR R7, R5, #6
	LDR R3, R5, #5
	SLL R3, R3, #3
	LEA R2, board_state
	ADD R3, R3, R2
	ADD R7, R7, R3
	CONST R3, #0
	STR R3, R7, #0
	LDR R7, R5, #4
	LDR R3, R5, #3
	SLL R3, R3, #3
	LEA R2, board_state
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R3, R5, #-4
	STR R3, R7, #0
	LDR R7, R5, #-3
L141_Chess
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;is_legal_ply;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
is_legal_ply
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-9	;; allocate stack space for local variables
	;; function body
	LEA R7, ply
	LEA R3, board_state
	LDR R2, R7, #1
	LDR R1, R7, #0
	SLL R1, R1, #3
	ADD R1, R1, R3
	ADD R2, R2, R1
	LDR R2, R2, #0
	STR R2, R5, #-6
	LDR R2, R7, #3
	LDR R7, R7, #2
	SLL R7, R7, #3
	ADD R7, R7, R3
	ADD R7, R2, R7
	LDR R7, R7, #0
	STR R7, R5, #-8
	LDR R7, R5, #-6
	CONST R3, #0
	CMP R7, R3
	BRnp L153_Chess
	LEA R7, L155_Chess
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	CONST R7, #0
	JMP L152_Chess
L153_Chess
	LDR R7, R5, #-6
	AND R7, R7, #8
	CONST R3, #0
	CMP R7, R3
	BRz L157_Chess
	CONST R7, #1
	STR R7, R5, #-9
	JMP L158_Chess
L157_Chess
	CONST R7, #0
	STR R7, R5, #-9
L158_Chess
	LDR R7, R5, #-9
	STR R7, R5, #-7
	LDR R7, R5, #-7
	LEA R3, player_to_move
	LDR R3, R3, #0
	CMP R7, R3
	BRz L159_Chess
	LEA R7, L161_Chess
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	CONST R7, #0
	JMP L152_Chess
L159_Chess
	LEA R7, ply
	LDR R3, R7, #3
	ADD R6, R6, #-1
	STR R3, R6, #0
	LDR R3, R7, #2
	ADD R6, R6, #-1
	STR R3, R6, #0
	LDR R3, R7, #1
	ADD R6, R6, #-1
	STR R3, R6, #0
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR is_legal_piece_move
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #4	;; free space for arguments
	CONST R3, #0
	CMP R7, R3
	BRz L162_Chess
	LEA R7, ply
	LDR R3, R7, #1
	LDR R7, R7, #0
	SLL R7, R7, #3
	LEA R2, board_state
	ADD R7, R7, R2
	ADD R7, R3, R7
	CONST R3, #0
	STR R3, R7, #0
	LEA R7, ply
	LDR R3, R7, #3
	LDR R7, R7, #2
	SLL R7, R7, #3
	LEA R2, board_state
	ADD R7, R7, R2
	ADD R7, R3, R7
	LDR R3, R5, #-6
	STR R3, R7, #0
	LEA R7, player_to_move
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRz L165_Chess
	CONST R7, #14
	STR R7, R5, #-9
	JMP L166_Chess
L165_Chess
	CONST R7, #6
	STR R7, R5, #-9
L166_Chess
	LDR R7, R5, #-9
	STR R7, R5, #-3
	CONST R7, #0
	STR R7, R5, #-2
L167_Chess
	CONST R7, #0
	STR R7, R5, #-1
L171_Chess
	LDR R7, R5, #-1
	LDR R3, R5, #-2
	SLL R3, R3, #3
	LEA R2, board_state
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	LDR R3, R5, #-3
	CMP R7, R3
	BRnp L175_Chess
	LDR R7, R5, #-2
	STR R7, R5, #-4
	LDR R7, R5, #-1
	STR R7, R5, #-5
L175_Chess
L172_Chess
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #8
	CMP R7, R3
	BRn L171_Chess
L168_Chess
	LDR R7, R5, #-2
	ADD R7, R7, #1
	STR R7, R5, #-2
	LDR R7, R5, #-2
	CONST R3, #8
	CMP R7, R3
	BRn L167_Chess
	LDR R7, R5, #-5
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R3, R5, #-4
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R3, R6, #0
	JSR is_king_in_check
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #4	;; free space for arguments
	CONST R3, #0
	CMP R7, R3
	BRz L177_Chess
	LEA R7, L179_Chess
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	LEA R7, ply
	LDR R3, R7, #1
	LDR R7, R7, #0
	SLL R7, R7, #3
	LEA R2, board_state
	ADD R7, R7, R2
	ADD R7, R3, R7
	LDR R3, R5, #-6
	STR R3, R7, #0
	LEA R7, ply
	LDR R3, R7, #3
	LDR R7, R7, #2
	SLL R7, R7, #3
	LEA R2, board_state
	ADD R7, R7, R2
	ADD R7, R3, R7
	LDR R3, R5, #-8
	STR R3, R7, #0
	CONST R7, #0
	JMP L152_Chess
L177_Chess
	CONST R7, #1
	JMP L152_Chess
L162_Chess
	CONST R7, #0
L152_Chess
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;init_castle_status;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
init_castle_status
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	LEA R7, castle
	CONST R3, #1
	STR R3, R7, #0
	STR R3, R7, #1
	LEA R7, castle
	CONST R3, #1
	STR R3, R7, #2
	LEA R7, castle
	CONST R3, #1
	STR R3, R7, #3
L180_Chess
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;update_castle_status;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
update_castle_status
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-6	;; allocate stack space for local variables
	;; function body
	LEA R7, ply
	STR R7, R5, #-1
	CONST R3, #0
	LDR R2, R7, #0
	CMP R2, R3
	BRnp L182_Chess
	LDR R7, R5, #-1
	LDR R7, R7, #1
	CMP R7, R3
	BRnp L182_Chess
	LEA R7, castle
	CONST R3, #0
	STR R3, R7, #1
L182_Chess
	LEA R7, ply
	STR R7, R5, #-2
	LDR R3, R7, #0
	CONST R2, #0
	CMP R3, R2
	BRnp L184_Chess
	LDR R7, R5, #-2
	LDR R7, R7, #1
	CONST R3, #7
	CMP R7, R3
	BRnp L184_Chess
	LEA R7, castle
	CONST R3, #0
	STR R3, R7, #0
L184_Chess
	LEA R7, ply
	STR R7, R5, #-3
	LDR R3, R7, #0
	CONST R2, #0
	CMP R3, R2
	BRnp L186_Chess
	LDR R7, R5, #-3
	LDR R7, R7, #1
	CONST R3, #4
	CMP R7, R3
	BRnp L186_Chess
	LEA R7, castle
	CONST R3, #0
	STR R3, R7, #0
	STR R3, R7, #1
L186_Chess
	LEA R7, ply
	STR R7, R5, #-4
	LDR R3, R7, #0
	CONST R2, #7
	CMP R3, R2
	BRnp L188_Chess
	LDR R7, R5, #-4
	LDR R7, R7, #1
	CONST R3, #0
	CMP R7, R3
	BRnp L188_Chess
	LEA R7, castle
	CONST R3, #0
	STR R3, R7, #1
L188_Chess
	LEA R7, ply
	STR R7, R5, #-5
	CONST R3, #7
	LDR R2, R7, #0
	CMP R2, R3
	BRnp L190_Chess
	LDR R7, R5, #-5
	LDR R7, R7, #1
	CMP R7, R3
	BRnp L190_Chess
	LEA R7, castle
	CONST R3, #0
	STR R3, R7, #0
L190_Chess
	LEA R7, ply
	STR R7, R5, #-6
	LDR R3, R7, #0
	CONST R2, #7
	CMP R3, R2
	BRnp L192_Chess
	LDR R7, R5, #-6
	LDR R7, R7, #1
	CONST R3, #4
	CMP R7, R3
	BRnp L192_Chess
	LEA R7, castle
	CONST R3, #0
	STR R3, R7, #0
	STR R3, R7, #1
L192_Chess
L181_Chess
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;test_castle_checks;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
test_castle_checks
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-1	;; allocate stack space for local variables
	;; function body
	LDR R7, R5, #5
	STR R7, R5, #-1
	JMP L198_Chess
L195_Chess
	LDR R7, R5, #-1
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R3, R5, #4
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR is_king_in_check
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #4	;; free space for arguments
	CONST R3, #0
	CMP R7, R3
	BRz L199_Chess
	CONST R7, #0
	JMP L194_Chess
L199_Chess
L196_Chess
	LDR R7, R5, #-1
	ADD R7, R7, #1
	STR R7, R5, #-1
L198_Chess
	LDR R7, R5, #-1
	LDR R3, R5, #6
	CMP R7, R3
	BRnz L195_Chess
	CONST R7, #1
L194_Chess
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;handle_short_castle;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
handle_short_castle
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-1	;; allocate stack space for local variables
	;; function body
	LEA R7, player_to_move
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRz L202_Chess
	CONST R7, #0
	STR R7, R5, #-1
	LEA R3, castle
	LDR R3, R3, #0
	CMP R3, R7
	BRz L203_Chess
	CONST R7, #7
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR is_clear_path
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #4	;; free space for arguments
	CONST R3, #0
	CMP R7, R3
	BRz L203_Chess
	CONST R7, #6
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR test_castle_checks
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #4	;; free space for arguments
	CONST R3, #0
	CMP R7, R3
	BRz L203_Chess
	LEA R7, board_state
	CONST R3, #0
	STR R3, R7, #4
	LEA R7, board_state
	CONST R3, #10
	STR R3, R7, #5
	LEA R7, board_state
	CONST R3, #14
	STR R3, R7, #6
	LEA R7, board_state
	CONST R3, #0
	STR R3, R7, #7
	CONST R7, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_square
	ADD R6, R6, #2	;; free space for arguments
	CONST R7, #5
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_square
	ADD R6, R6, #2	;; free space for arguments
	CONST R7, #6
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_square
	ADD R6, R6, #2	;; free space for arguments
	CONST R7, #7
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_square
	ADD R6, R6, #2	;; free space for arguments
	LEA R7, castle
	CONST R3, #0
	STR R3, R7, #0
	STR R3, R7, #1
	CONST R7, #1
	JMP L201_Chess
L202_Chess
	LEA R7, castle
	LDR R7, R7, #2
	CONST R3, #0
	CMP R7, R3
	BRz L208_Chess
	CONST R7, #7
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R3, #4
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR is_clear_path
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #4	;; free space for arguments
	CONST R3, #0
	CMP R7, R3
	BRz L208_Chess
	CONST R7, #6
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #7
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR test_castle_checks
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #4	;; free space for arguments
	CONST R3, #0
	CMP R7, R3
	BRz L210_Chess
	LEA R7, board_state
	CONST R3, #60
	ADD R7, R7, R3
	CONST R3, #0
	STR R3, R7, #0
	LEA R7, board_state
	CONST R3, #61
	ADD R7, R7, R3
	CONST R3, #2
	STR R3, R7, #0
	LEA R7, board_state
	CONST R3, #62
	ADD R7, R7, R3
	CONST R3, #6
	STR R3, R7, #0
	LEA R7, board_state
	CONST R3, #63
	ADD R7, R7, R3
	CONST R3, #0
	STR R3, R7, #0
	CONST R7, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #7
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_square
	ADD R6, R6, #2	;; free space for arguments
	CONST R7, #5
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #7
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_square
	ADD R6, R6, #2	;; free space for arguments
	CONST R7, #6
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #7
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_square
	ADD R6, R6, #2	;; free space for arguments
	CONST R7, #7
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_square
	ADD R6, R6, #2	;; free space for arguments
	LEA R7, castle
	CONST R3, #0
	STR R3, R7, #2
	LEA R7, castle
	CONST R3, #0
	STR R3, R7, #3
	CONST R7, #1
	JMP L201_Chess
L210_Chess
L208_Chess
L203_Chess
	CONST R7, #0
L201_Chess
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;handle_long_castle;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
handle_long_castle
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-1	;; allocate stack space for local variables
	;; function body
	LEA R7, player_to_move
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRz L213_Chess
	CONST R7, #0
	STR R7, R5, #-1
	LEA R3, castle
	LDR R3, R3, #1
	CMP R3, R7
	BRz L214_Chess
	CONST R7, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR is_clear_path
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #4	;; free space for arguments
	CONST R3, #0
	CMP R7, R3
	BRz L214_Chess
	CONST R7, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R3, #2
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR test_castle_checks
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #4	;; free space for arguments
	CONST R3, #0
	CMP R7, R3
	BRz L214_Chess
	LEA R7, board_state
	CONST R3, #0
	STR R3, R7, #0
	CONST R3, #14
	STR R3, R7, #2
	LEA R7, board_state
	CONST R3, #10
	STR R3, R7, #3
	LEA R7, board_state
	CONST R3, #0
	STR R3, R7, #4
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_square
	ADD R6, R6, #2	;; free space for arguments
	CONST R7, #2
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_square
	ADD R6, R6, #2	;; free space for arguments
	CONST R7, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_square
	ADD R6, R6, #2	;; free space for arguments
	CONST R7, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_square
	ADD R6, R6, #2	;; free space for arguments
	LEA R7, castle
	CONST R3, #0
	STR R3, R7, #0
	STR R3, R7, #1
	CONST R7, #1
	JMP L212_Chess
L213_Chess
	CONST R7, #0
	STR R7, R5, #-1
	LEA R3, castle
	LDR R3, R3, #3
	CMP R3, R7
	BRz L219_Chess
	CONST R7, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #7
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R3, R5, #-1
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR is_clear_path
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #4	;; free space for arguments
	CONST R3, #0
	CMP R7, R3
	BRz L219_Chess
	CONST R7, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R3, #2
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #7
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR test_castle_checks
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #4	;; free space for arguments
	CONST R3, #0
	CMP R7, R3
	BRz L221_Chess
	LEA R7, board_state
	CONST R3, #56
	ADD R7, R7, R3
	CONST R3, #0
	STR R3, R7, #0
	LEA R7, board_state
	CONST R3, #58
	ADD R7, R7, R3
	CONST R3, #6
	STR R3, R7, #0
	LEA R7, board_state
	CONST R3, #59
	ADD R7, R7, R3
	CONST R3, #2
	STR R3, R7, #0
	LEA R7, board_state
	CONST R3, #60
	ADD R7, R7, R3
	CONST R3, #0
	STR R3, R7, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #7
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_square
	ADD R6, R6, #2	;; free space for arguments
	CONST R7, #2
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #7
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_square
	ADD R6, R6, #2	;; free space for arguments
	CONST R7, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #7
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_square
	ADD R6, R6, #2	;; free space for arguments
	CONST R7, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #7
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_square
	ADD R6, R6, #2	;; free space for arguments
	LEA R7, castle
	CONST R3, #0
	STR R3, R7, #2
	LEA R7, castle
	CONST R3, #0
	STR R3, R7, #3
	CONST R7, #1
	JMP L212_Chess
L221_Chess
L219_Chess
L214_Chess
	CONST R7, #0
L212_Chess
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;handle_castle;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
handle_castle
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	LEA R7, ply
	LDR R7, R7, #4
	CONST R3, #1
	CMP R7, R3
	BRnp L224_Chess
	JSR handle_short_castle
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	JMP L223_Chess
L224_Chess
	LEA R7, ply
	LDR R7, R7, #4
	CONST R3, #2
	CMP R7, R3
	BRnp L226_Chess
	JSR handle_long_castle
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	JMP L223_Chess
L226_Chess
	CONST R7, #0
L223_Chess
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;main;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
main
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-1	;; allocate stack space for local variables
	;; function body
	LEA R7, L229_Chess
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	JSR draw_chessboard
	ADD R6, R6, #0	;; free space for arguments
	JSR init_castle_status
	ADD R6, R6, #0	;; free space for arguments
	LEA R7, player_to_move
	CONST R3, #1
	STR R3, R7, #0
	JMP L231_Chess
L230_Chess
	LEA R7, player_to_move
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRz L233_Chess
	LEA R7, L235_Chess
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	JMP L234_Chess
L233_Chess
	LEA R7, L236_Chess
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
L234_Chess
	JSR get_ply
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	LDR R7, R5, #-1
	CONST R3, #-1
	CMP R7, R3
	BRnp L237_Chess
	LEA R7, L239_Chess
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
L237_Chess
	LDR R7, R5, #-1
	CONST R3, #-2
	CMP R7, R3
	BRnp L240_Chess
	LEA R7, L242_Chess
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	JSR lc4_halt
	ADD R6, R6, #0	;; free space for arguments
L240_Chess
	LDR R7, R5, #-1
	CONST R3, #1
	CMP R7, R3
	BRnp L243_Chess
	LEA R7, ply
	LDR R7, R7, #4
	CONST R3, #0
	CMP R7, R3
	BRz L245_Chess
	JSR handle_castle
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	CONST R3, #0
	CMP R7, R3
	BRz L247_Chess
	LEA R7, player_to_move
	CONST R3, #1
	LDR R2, R7, #0
	SUB R3, R3, R2
	STR R3, R7, #0
	JMP L246_Chess
L247_Chess
	LEA R7, L249_Chess
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	JMP L246_Chess
L245_Chess
	JSR is_legal_ply
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	CONST R3, #0
	CMP R7, R3
	BRz L250_Chess
	LEA R7, L252_Chess
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	LEA R7, ply
	LDR R3, R7, #3
	ADD R6, R6, #-1
	STR R3, R6, #0
	LDR R7, R7, #2
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_square
	ADD R6, R6, #2	;; free space for arguments
	LEA R7, ply
	LDR R3, R7, #1
	ADD R6, R6, #-1
	STR R3, R6, #0
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_square
	ADD R6, R6, #2	;; free space for arguments
	JSR update_castle_status
	ADD R6, R6, #0	;; free space for arguments
	LEA R7, player_to_move
	CONST R3, #1
	LDR R2, R7, #0
	SUB R3, R3, R2
	STR R3, R7, #0
	JMP L251_Chess
L250_Chess
	LEA R7, L253_Chess
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
L251_Chess
L246_Chess
L243_Chess
L231_Chess
	JMP L230_Chess
	CONST R7, #0
L228_Chess
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

		.DATA
ply 		.BLKW 5
		.DATA
castle 		.BLKW 4
		.DATA
L253_Chess 		.STRINGZ "\nIllegal Move!!\n"
		.DATA
L252_Chess 		.STRINGZ "\nLegal Move\n"
		.DATA
L249_Chess 		.STRINGZ "\n Illegal Castle! \n"
		.DATA
L242_Chess 		.STRINGZ "\nGame Ending\n"
		.DATA
L239_Chess 		.STRINGZ "\nBad PLY entered\n"
		.DATA
L236_Chess 		.STRINGZ "\n Black to move \n"
		.DATA
L235_Chess 		.STRINGZ "\n White to move \n"
		.DATA
L229_Chess 		.STRINGZ "!!! Welcome to LC4 Chess !!!\n"
		.DATA
L179_Chess 		.STRINGZ "\n Bad Move - King would be in check! \n"
		.DATA
L161_Chess 		.STRINGZ "\n Other side to move \n"
		.DATA
L155_Chess 		.STRINGZ "\n No piece selected \n"
		.DATA
L26_Chess 		.STRINGZ "\n"
		.DATA
L19_Chess 		.STRINGZ "-32768"
		.DATA
L13_Chess 		.STRINGZ "0"
