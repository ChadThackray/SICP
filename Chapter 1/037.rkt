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

; About 12 steps required for 4 dp
(/ 1 (cont-frac-recursive (lambda (i) 1.0)
           (lambda (i) 1.0)
           12))
(/ 1 (cont-frac-iter (lambda (i) 1.0)
           (lambda (i) 1.0)
           12))
