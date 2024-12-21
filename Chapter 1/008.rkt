#lang sicp

(define (square x)
  (* x x))
(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough2 guess x)
  (> 0.00000000001 (abs (- 1 (/ guess (improve guess x))))))


(define (root-iter2 guess x)
  (display guess)
  (newline)
  (if (good-enough2 guess x)
      guess
      (root-iter2 (improve guess x) x)))

(root-iter2 1.0 27)

