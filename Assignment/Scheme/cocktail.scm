(define (bubblesort-up lst)
	(display "\n")
	(display "Going up: ")
	(display lst)
	(cond
		((null? (cdr lst)) lst)
		((< (car lst) (cadr lst)) 
			(cons (car lst) (bubblesort-up (cdr lst))))
		(else 
			(cons (cadr lst) (bubblesort-up(cons (car lst) (cddr lst)))))
	)
)

(define (bubblesort-down lst)
	(display "\n")
	(display "Going down: ")
	(display lst)
	(if(not(null? (cdr lst)))
		(let ((current-element (car lst)) (compare-to (bubblesort-down(cdr lst))))
			(if (< (car compare-to) current-element)
				(cons (car compare-to) (cons current-element (cdr compare-to)))
				(cons (car lst) compare-to))
			)
	lst)
)

(define (check-sorted lst)
	(cond
		((null? (cdr lst)) #t)
		((> (car lst) (cadr lst)) #f)
		(else (check-sorted(cdr lst)))
	)
)

(define (cocktail-sort lst)
	(cond
		((null? lst) 'fail)
		((check-sorted lst) lst)
		(else
			(cocktail-sort
				(bubblesort-down 
					(bubblesort-up lst)
				)
			)
		)
	)
)

(define lst '(6 9 4 2 0 7 2 -1 -2 7))

(cocktail-sort lst)
