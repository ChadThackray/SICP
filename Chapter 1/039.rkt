#lang sicp

(define (cont-frac-iter n d k)
  (define (iter n d k sum)
    (cond ((= k 0) sum)
          (else (iter n d (- k 1) (/ (n k) (+ sum (d k))) ))))
  (iter n d k 0))

(define (cont-frac-recursive n d k)
  (define (cont-frac-recursive-inner n d k i)
    (if (= k i)
        (/ (n k) (d k))
        (/ (n i) (+ (d i) (cont-frac-recursive-inner n d k (+ 1 i))))))

  (cont-frac-recursive-inner n d k 1))

(define (di k)
  (- (* 2 k) 1))

(define (square x) (* x x))

(define (tan-cf x k)
  (define (ni k)
    (if (= 1 k)
        x
        (* -1 (square x))))
  (cont-frac-iter ni di k))

; close enough, should be one
(tan-cf (/ 3.14159265 4) 20)


