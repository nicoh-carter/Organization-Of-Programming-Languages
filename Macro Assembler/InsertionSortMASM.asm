;Name: Nicoh Carter
;Purpose: Insertion Sort
;Language: Macro Assembler

.386
.model flat, stdcall
.STACK

include kernel32.inc
include masm32.inc
includelib kernel32.lib
includelib masm32.lib

.DATA
ExitMsg		byte		"Press any key to continue.	. . ", 00dh, 00ah, 0

CRLF		byte		00dh, 00ah, 0

SPACE		byte		" ", 0

UnsortedMsg	byte		"Unsorted Array", 00dh, 00ah, 0
SortedMsg	byte		"Sorted Array", 00dh, 00ah, 0

array		dword		34, 56, 4, 10, 77, 51, 93, 30, 5, 52
endarray	dword 		0	
arraysize	equ			endarray-array

temp		dword		0

string		byte		10 dup (0)
continue	byte		0

.CODE
main		proc
;
;			Print Unsorted Array					;for (i = 0; i < arraysize; i++)
;
			invoke		StdOut,addr UnsortedMsg		;print "Unsorted Array" CRLF
			mov			ebx, 0						;start the loop at 0 (i = 0)
top1:
			cmp			ebx, arraysize				;compare the number in ebx to arraysize (i < arraysize)
			jge			exit1						;jump if the number is greater than or equal to arraysize
;
;			Print the number
;
			mov			eax, array[ebx]				;move the number in array indexed by ebx to eax (array[i])
			invoke		dwtoa, eax, addr string		;convert the number to an ASCII string
			invoke		StdOut, addr string			;print the number
			invoke		StdOut, addr SPACE			;print a space
;			
;			Increment the loop variable and continue looping
;
			add			ebx, sizeof(dword)			;increment the number in ebx by 4 (i++)
			jmp			top1						;loop back to the top of the loop
exit1:
			invoke		StdOut,addr CRLF			;print a CRLF
			invoke		StdOut,addr CRLF			;print a CRLF
;			
;			Insertion Sort
;
;			for(i = 1; i < array.length; i++)
;
			mov			ebx,sizeof(dword)			;move 4 to ebx(i = 1)
outterloop:
			cmp			ebx, arraysize				;compare the number in ebx to arraysize (i < arraysize)
			jge			endoutter					;jump if the number is greater than or equal to arraysize
;
;			temp = array[i]
;
			mov			eax, array[ebx]				;move array[i] to eax
			mov			temp, eax					;move eax to temp
;
;			for(j = i - 1l j > = 0 && temp < array[j]; j--)
;
			mov			ecx, ebx					;move ebx to ecx (j = 1)
			sub			ecx, sizeof(dword)			;start ecx at ebx - 4 (j = i - 1)
innerloop:
			cmp			ecx, 0						;compare the number in ecx to 0 (j >= 0 && . . .)
			jl			endinner					;jump if the number is less than 0
;
			mov			eax, temp					;move temp to eax
			cmp			eax, array[ecx]				;compare temp to array[j] (. . . && temp < array[j])
			jge			endinner					;jump if temp is greater than or equal to array[j]
;
;			array[j+1] = array[j]
;
			mov 		eax, array[ecx]				;move array[j] to ecx
			mov 		edx, ecx					;move ecx to edx (j)
			add			edx, sizeof(dword)			;add 4 to edx(j + 1)
			mov			array[edx], eax				;move array[j] to array [j+1]
;
;			decrement the inner loop variable and continue looping
;
			sub			ecx, sizeof(dword)			;subtract 4 from ecx (j--)
			jmp			innerloop					;loop back to the top of the inner loop
;
;			array[j+1] = temp
;
endinner:
			mov			edx, ecx					;move ecx to edx (j)
			add			edx, sizeof(dword)			;add 4 to edx (j + 1)
			mov			eax, temp					;move temp to eax
			mov			array[edx], eax				;move temp to array[j+1]
;
;			Increment the outter loop variable and continue looping
;
			add			ebx, sizeof(dword)			;increment the number in ebx by 4 (i++)
			jmp			outterloop
endoutter:
;
;			Print Sorted Array						;for (i = 0; i < arraysize; i++)
;			
			invoke		StdOut, addr SortedMsg		;print "Sorted Array" CRLF
			mov			ebx, 0						;start the loop at 0 (i = 0)
top2:
			cmp			ebx, arraysize				;compare the number in ebx to arraysize (i < arraysize)
			jge			exit2						;jump if the number is greater than or equal to arraysize
;			
;			Print the number
;
			mov			eax, array[ebx]				;move the number in array indexed by ebx to eax (array[i])
			invoke 		dwtoa, eax, addr string		;convert the number to an ASCII string
			invoke		StdOut, addr string			;print the number
			invoke		StdOut, addr SPACE			;print a SPACE	
;			
;			Increment the loop variable and continue loopin
;
			add			ebx,sizeof(dword)			;increment the number in ebx by 4 (i++)
			jmp			top2						;loop back to the top of the loop
exit2:		
			invoke		StdOut, addr CRLF			;print a CRLF
;
;			Print the exit message
;
			invoke		StdOut, addr ExitMsg		;print the exit message
			invoke		StdIn, addr continue,1		;read to keep console window open
;
			invoke		ExitProcess, 0				;exit
;
main		endp
			end			main