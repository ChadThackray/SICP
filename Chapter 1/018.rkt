#lang sicp
(define (double n) (+ n n))
(define (halve n) (/ n 2))
(define (mult-iter x y a)
    (cond ((= y 0) a)
          ((= (remainder y 2) 0) (mult-iter (double x) (halve y) a))
          (else (mult-iter x (- y 1) (+ a x)))))

(mult-iter 12 5 0)