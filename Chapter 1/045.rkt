#lang sicp

(define (square x) (* x x))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (repeated (compose f f) (- n 1))))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))


(define (nth-power x n)
  (if (= 1 n) 
      x
      (* x (nth-power x (- n 1)))))

(define (n-th-root x n)
  (fixed-point 
    ((repeated average-damp 4) (lambda (y) (/ x (nth-power y (- n 1)))))
    2.0))

; CBA to find how many damps you need, don't think it's too important
; Just increase as you need above.
(n-th-root 27 100)

