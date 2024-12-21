#lang sicp

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))


; (f n) is 2n
; (g n) is 2^n
; (h n) is 2^2^2^2.... (n 2's)