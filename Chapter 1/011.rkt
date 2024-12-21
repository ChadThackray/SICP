#lang sicp

; recursive
(define (f1 n)
  (cond ((> 3 n) n)
        (else (+ (f1 (- n 1)) (* 2 (f1 (- n 2))) (* 3 (f1 (- n 3))) ))))

; Iterative
(define (f2 n counter a b c)
  (cond ((> counter (- n 3)) a)
        (else (f2 n (inc counter) (+ a (* 2 b) (* 3 c)) a b))))

(f1 4)
(f2 4 0 0 1 2)