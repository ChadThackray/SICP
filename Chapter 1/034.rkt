#lang sicp

(define (square x) (* x x))

(define (f g)
  (g 2))

(f square)
(f (lambda (z) (* z (+ z 1))))
(f f)
; We get "Not a procedure" because (2 2) doesn't make sense
; There is no produre named 2

