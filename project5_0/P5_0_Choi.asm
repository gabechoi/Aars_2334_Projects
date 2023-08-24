; Author:					Gabriel Choi
; Assignment Title:			Calculate Average
; Assignment Description:	This program will prompt the user for 4 grades
;							and output the average and sum of the total
; Due Date:					3/4/2023
; Date Created:				3/3/2023
; Date Last Modified:		3/4/2023

.586
.MODEL FLAT

INCLUDE io.h				; header file for input/output

.STACK 4096

.DATA
prompt1 BYTE    "Enter first grade", 0
prompt2 BYTE    "Enter second grade", 0
prompt3 BYTE    "Enter third grade", 0
prompt4 BYTE    "Enter fourth grade", 0
string  BYTE    40 DUP (?)
resultLbl BYTE  "Result", 0
sumLbl  BYTE	"Sum:", 20h
sum     BYTE    11 DUP (?), 0dh
avgLbl  BYTE	"Avg:", 20h
avg		BYTE	11 DUP (?), 0

.CODE
_MainProc PROC
        input   prompt1, string, 40     ; read ASCII characters
        atod    string					; convert to integer
        mov     ebx, eax				; store in memory

        input   prompt2, string, 40     ; repeat for second number
        atod    string					; convert to integer
        add		ebx, eax				; add grade 1 and grade 2

		input   prompt3, string, 40     ; repeat for second number
        atod    string					; convert to integer
        add		ebx, eax				; add grade 3 to total

		input   prompt4, string, 40     ; repeat for second number
        atod    string					; convert to integer
        add		ebx, eax				; add 4th grade to total
		add		ebx, eax				; add 4th grade to total again
        
        dtoa    sum, ebx				; convert to ASCII characters
		mov		eax, ebx				; move total to quotient
		mov		edx, 0					; set ebx to zero
		mov		ebx, 5					; set the dividend
		div		ebx						; find average
		dtoa	avg, eax				; convert to ASCII characters
        output  resultLbl, sumLbl       ; output label and sum

        sub     eax, eax				; exit with return code 0

        ret
_MainProc ENDP
END										; end of source code

