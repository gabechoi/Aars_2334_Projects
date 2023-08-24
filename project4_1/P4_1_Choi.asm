; Author:					Gabriel Choi
; Assignment Title:			Bocce Perimeter
; Assignment Description:	P4_1_Choi.asm - gets a length and width from the
;							user and calculates the Bocce perimeter from the
;							input
; Due Date:					2/24/2023
; Date Created:				2/24/2023
; Date Last Modified:		2/24/2023

.586
.MODEL FLAT

INCLUDE io.h								; header file for input/output

.STACK 4096

.DATA
prompt1   BYTE    "Enter width", 0
prompt2   BYTE    "Enter length", 0
string    WORD    40 DUP (?)
resultLbl BYTE    "The sum is", 0
perimeter WORD    11 DUP (?), 0

.CODE
_MainProc PROC
        input   prompt1, string, 40			; read ASCII characters
        atow    string						; convert to integer
        mov     bx, ax						; store in memory
		add		bx, bx						; doubles bx

        input   prompt2, string, 40			; repeat for second number
        atow    string						; convert to integer
        add     ax, ax						; doubles ax
        
        add     ax, bx						; add second number
        wtoa    perimeter, ax				; convert to ASCII characters
        output  resultLbl, perimeter        ; output label and sum

        sub     ax, ax						; exit with return code 0
        ret
_MainProc ENDP
END											; end of source code

