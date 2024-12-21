#lang sicp

(define (square x) (* x x))
(define (sum-of-squares x y) (+ (square x) (square y)))

; This only works when one number is actually bigger than the others
; I'm not sure how to handle that situation yet.
(define (func a b c) 
    (cond ((and (> a c) (> b c)) (sum-of-squares a b))
          ((and (> a b) (> c b)) (sum-of-squares a c))
          ((and (> b a) (> c a)) (sum-of-squares b c))
          (else false)
    )
)


(func 1 2 3)