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
  (if (= 0 (remainder (+ 1 k) 3))
      (* 2 (/ (+ 1 k) 3))
      1))

(+ 2 (cont-frac-recursive (lambda (i) 1.0)
           di
           50))

(+ 2 (cont-frac-iter (lambda (i) 1.0)
           di
           50))


