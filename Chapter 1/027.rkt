#lang sicp

(define (square x) (* x x))

(define (expmod base exp m)
 (cond ((= exp 0) 1)
       ((even? exp)
        (remainder (square (expmod base (/ exp 2) m)) m))
       (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (test-carmicheal n a)
  (cond ((= n a) (display "DONE"))
        ((= (expmod a n n) a) (test-carmicheal n (+ 1 a)))
        (else (display a))
        ))

(test-carmicheal 561 1)
; No printout, hence all numbers < 561 satisfy a^n = a mod n