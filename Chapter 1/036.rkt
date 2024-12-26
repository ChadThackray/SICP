#lang sicp

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

; ϕ = (1 + sqrt(5))/ 2
; (2ϕ - 1)^2 = 5
; ϕ^2 - ϕ = 1
; ϕ = 1/ϕ + 1
; Therefore ϕ is a fixed point of x = 1/x + 1

(define (average x y)
  (/ (+ x y) 2))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 5.0)

; Many fewer steps required when using averaging 
(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 5.0)

;(fixed-point cos 1.0)
