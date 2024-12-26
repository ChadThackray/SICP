#lang sicp


(define (iterative-improve good-enough? improve)
  (define (check guess)
    (if (good-enough? guess)
        guess
        (check (improve guess))))
  (lambda (x) (check x)))


(define (square x)
  (* x x))
(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (define (improve guess)
    (average guess (/ x guess)))

  (define (good-enough guess)
    (< (abs (- (square guess) x)) 0.001))

  ((iterative-improve good-enough improve) 1.0))

(define tolerance 0.000001)
(define (fixed-point f first-guess)
  (define (close-enough? guess)
    (< (abs (- (f guess) guess)) tolerance))

  ((iterative-improve close-enough? f) first-guess))

;(sqrt 49)

(fixed-point cos 1.0)