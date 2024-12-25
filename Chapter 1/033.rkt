#lang sicp

(define (square x) (* x x))

(define (divides? a b)
 (= (remainder b a) 0))

(define (next n)
 (if (= n 2)
     3
     (+ n 2)))

(define (find-divisor n test-divisor)
 (cond ((> (square test-divisor) n) n)
       ((divides? test-divisor n) test-divisor)
       (else (find-divisor n (next test-divisor)))))

(define (smallest-divisor n)
 (find-divisor n 2))

(define (prime? n)
 (if (= 1 n)
   false
   (= n (smallest-divisor n))))

(define (accumulate-filtered filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (if (filter a) 
          (combiner (term a) (accumulate-filtered filter combiner null-value term (next a) next b))
          (accumulate-filtered filter combiner null-value term (next a) next b))))

(define (inc a)
  (+ 1 a))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))



(define (nothing a) a)

(define (sum-of-relative-primes n)
  (define (relative-prime-filter i)
    (if (= 1 (gcd i n))
        true
        false))
  (accumulate-filtered relative-prime-filter + 0 nothing 1 inc (- n 1)))

(define (sum-of-prime-squares a b)
  (accumulate-filtered prime? + 0 square a inc b))

(sum-of-prime-squares 1 10)
(sum-of-relative-primes 10)
