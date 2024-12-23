#lang sicp



(define (exp-iter n b a)
    (cond ((= n 0) a)
          ((= (remainder n 2) 0) (exp-iter (/ n 2) (* b b) a))
          (else (exp-iter (- n 1) b (* a b)))))

(exp-iter 10 2 1)