#lang sicp

(define (inc n) (+ 1 n))
(define (cube x) (* x x x))

(define (simpsons-rule f a b n)

  (let ((h (/ (- b a) n)))

    (define (next-term k)
      (cond ((= 0 k) (f a))
            ((= n k) (f (+ a (* n h))))
            ((odd? k) (* 4 (f (+ a (* k h)))))
            ((even? k) (* 2 (f (+ a (* k h)))))

            ))

    (define (sum term a next b)
      (if (> a b)
          0
          (+ (term a)
             (sum term (next a) next b))))

    (* (/ h 3)  (sum next-term 1 inc n))))

(simpsons-rule cube 0.0 1.0 1000)
