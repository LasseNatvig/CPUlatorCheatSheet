.global _start 
_start:
// CPUlator "cheat-sheet", an appendix at TDT4258-exam November 2024, V0.5
//************************************************************************
// Abbreviations used: dec = decimal. mm = immediate
// Registers: R0, R1 ... R12. R13 = SP, R14 = LR, R15 = PC
// Register convention on function calls: Parameters passed in R0..R3, additional
// parameters passed via stack. Values are returned in R0..R1. R0..R3 are caller
// saved registers, and R4-12 are calle saved registers
	MOV R0, #15  // MOVe immediate value 15 (dec) to register R0
	MOV R8, R0 // MOVe (ie. copy) value of R0 into R8
	LDR R1, =a // LoaD address of a into Register R1
	LDR R2, [R1] // LDR, load what R1 points to into R2
	LDR R3, [R1, #4] // LDR, load what R1 points to + offsett 4 (dec)
	ADD R4, R2, R3 // ADDs R2 and R3 and stores result in R4
	ADD R4, R4, #1 // ADDs immediate value 1 (dec) to R4
	STR R5, [R1]  // offset can be used like for LDR
	B proceed // Branch unconditionally to label
	B . // Branch unconditionally to itself (.), gives endless loop
proceed: // label
	CMP R2, R3 // CoMPare register R2 and R3, store result in status register
	BLT nice // Branch Less Than, branch to label if R2 was less than R3
	// BEQ=B Equal,BGE greater or equal,NE NotEqual,LT LessThan,GT GreaterThan  
	MOV R0, #5555 // translated to MOVW (MOV word) since imm const is large
	B kind //
nice:
	SUB R4, R3, #2 // SUBtracts 2 from R3 and stores in R4 	
kind:
	MOV R1, #2
	LSL R2, R1, #2 //Logical Shift Left R1 with 2 bit positions, assign to R2
	PUSH {R1} // PUSH and POP operates on the stack
	PUSH {R2}  // it is a LIFO structure (Last In First Out)
	POP {R1}
	POP {R2} // values of R1 and R2 are now swapped
	// some logical instr here
// BL, BX, Right shift masking 




.section .data
a: // array a[0], a[1], a[2]
	.word 10 // decimal values
	.word 20 // word is 4 bytes
	.word 30
x:
	