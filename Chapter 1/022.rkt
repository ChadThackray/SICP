#lang sicp

(define (square x) (* x x))

(define (divides? a b)
 (= (remainder b a) 0))

(define (find-divisor n test-divisor)
 (cond ((> (square test-divisor) n) n)
       ((divides? test-divisor n) test-divisor)
       (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
 (find-divisor n 2))

(define (prime? n)
 (= n (smallest-divisor n)))

(define (report-prime elapsed-time)
 (display " *** ")
 (display elapsed-time))

(define (start-prime-test n start-time)
 (if (prime? n)
  (report-prime (- (runtime) start-time))))

(define (timed-prime-test n)
 (newline)
 (display n)
 (start-prime-test n (runtime)))
 

 (define (search-for-primes n end)
  (timed-prime-test n)
  (if (> n end) 
      (display "DONE!")
      (search-for-primes (+ n 2) end)))

; numbers are too small to verify time order but I'll trust it
;(search-for-primes 1001 1100)
;(search-for-primes 10001 11000)
;(search-for-primes 100001 110000)

; (prime? 1009)