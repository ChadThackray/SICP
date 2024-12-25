#lang sicp

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))
        ))
  (iter a 1))

(define (product-recursive term a next b)
  (if (> a b)
      1
      (* (term a) (product-recursive term (next a) next b))))

(define (inc a)
  (+ 1 a))

(define (pitermfunc a)
  (if (even? a)
      (/ (+ 2 a) (+ 1 a))
      (/ (+ 1 a) (+ 2 a))))

(define (factfunc a) a)

(* 4 (product-iter pitermfunc 1.0 inc 100))

;factorial
(define (factorial x) (product-recursive factfunc 1 inc x ))
(factorial 3)


