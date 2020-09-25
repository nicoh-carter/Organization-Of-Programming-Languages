#lang racket

; Name: Nicoh Carter
; Purpose: Insertion Sort
; Language: Racket

(define array '(34 56 4 10 77 51 93 30 5 52))

(define (sort array)
        (cond
	((= (length array) 1) array)
	((<= (car array) (cadr array)) (check-again (cons (car array) (sort (cdr array)))))
	(#t (check-again (cons (cadr array) (sort (cons (car array) (cddr array))))))
        )
)

(define (check-again array)
	(if (<= (car array) (cadr array)) array
	        (sort array))
)

(printf "Unsorted Array:\n ~a \n" array)
(printf "Sorted Array:\n ~a \n" (sort array))