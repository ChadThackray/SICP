#lang sicp

(define (square x)
  (* x x))
(define (average x y)
  (/ (+ x y) 2))
(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough1 guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter1 guess x)
  (if (good-enough1 guess x)
      guess
      (sqrt-iter1 (improve guess x) x)))

; Does not finish
;(sqrt-iter1 1.0 123456789012345)

; evaluates to 0.0312500131557789 (wrong)
;sqrt-iter1 1.0 0.00000000123456)

(define (good-enough2 guess x)
  (> 0.00000000001 (abs (- 1 (/ guess (improve guess x))))))
  

(define (sqrt-iter2 guess x)
  (if (good-enough2 guess x)
      guess
      (sqrt-iter2 (improve guess x) x)))

; New sqrt-iter2 will work with large and small numbers with a small relative error.


