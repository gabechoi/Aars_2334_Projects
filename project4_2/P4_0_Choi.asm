; Author:					Gabriel Choi
; Assignment Title:			Evaluate An Expression
; Assignment Description:	P4_0_Choi.asm - this code creates takes in input
;							from the user for amount of apples(x), oranges(y), 
;							and bananas(z). Then it evaluates the expression
;							of 5x + 5y - 2z.
; Due Date:					2/24/2023
; Date Created:				2/24/2023
; Date Last Modified:		2/24/2023

.586
.MODEL FLAT

INCLUDE io.h							; header file for input/output

.STACK 4096

.DATA
prompt1 BYTE    "Enter number of apples", 0
prompt2 BYTE    "Enter number of oranges", 0
prompt3 BYTE	"Enter number of bananas", 0
string  DWORD    40 DUP (?)
resultLbl BYTE  "The number of fruits are", 0
sum     DWORD    11 DUP (?), 0

.CODE
_MainProc PROC
        input   prompt1, string, 40     ; read first number
        atod    string					; convert to integer
        mov     ebx, eax				; store in memory

        input   prompt2, string, 40     ; repeat for second number
        atod    string					; convert to integer

		add		ebx, eax				; ebx = num1 + num2
		sub		eax, eax				; eax = 0
		add		eax, ebx				; eax = num1 + num2
		add		ebx, ebx				; ebx = 2(num1 + num2)
		add		ebx, ebx				; ebx = 4(num1 + num2)
		add		ebx, eax				; ebx = 5(num1 + num2)

		input	prompt3, string, 40	; read in third number
		atod	string					; convert to integer

		add		eax, eax				; doubles third number
		neg		eax						; converts value in eax to negative

		add		eax, ebx				; adds together all numbers in as 
										;5x + 5y - 2z

        dtoa    sum, eax				; convert to ASCII characters
        output  resultLbl, sum          ; output label and sum

        mov     eax, 0					; exit with return code 0
        ret
_MainProc ENDP
END										; end of source code

