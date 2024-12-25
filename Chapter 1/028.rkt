#lang sicp

; I had to cheat a bit here and use a local variable
; I'm sure it can be done without but just seemed weird to me to do so

(define (square x) (* x x))

(define (expmod base exp m)
 (cond ((= exp 0) 1)
       ((even? exp)
         (let ((num (expmod base (/ exp 2) m)))
         (if (and (> num 1) (< num (- m 1)) (= (remainder (square num) m) 1))
         0
         (remainder (square num) m))))
       (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (miller-rabin-test n)
 (define (try-it a)
  (= (expmod a (- n 1) n) 1))
 (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
 (cond ((= times 0) true)
       ((miller-rabin-test n) (fast-prime? n (- times 1)))
       (else false)))

;(expmod 5 (- 11 1) 11)
(fast-prime? 6601 100)


