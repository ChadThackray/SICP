#lang sicp

; basic version
; (define (* a b)
;     (if (= b 0)
;         0
;         (+ a (* a (- b 1)))))

; Log version
(define (double n) (+ n n))
(define (halve n) (/ n 2))
(define (* a b)
    (cond ((= b 0) 0)
          ((= a 0) 0)
          ((= (remainder b 2) 0) (double (* a (halve b))))
          (else (+ a (* a (- b 1))))))

(* 5 10)