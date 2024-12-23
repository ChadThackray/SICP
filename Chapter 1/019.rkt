#lang sicp

; Fibbonachi numbers in log(n) time


; Our normal iterative formula for fib is T
; a -> a + b, and b -> a
; And T^n gives you the nth and nth+1 fib numbers

; consider this a special case of T_pq 
; a -> bq + aq + ap, and b -> bp + aq
; where p = 0 and q = 1

; applying twice in a row
; b' = (bp + aq)p + (bq + aq + ap)q
;   = bp^2 + 2aqp + bq^2 + aq^2

; a'=  (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p
;   = bpq + aq^2 + bq^2 + aq^2 + apq + bpq + apq + ap^2
;   = 2aq^2 + bq^2 + 2bpq + 2apq + ap^2

; a' - b' = 2bpq + aq^2 + ap^2 - bq^2
;         = aq^2 - bq^2 + ap^2 + bp^2 - bp^2 + 2bpq
;         = (a-b)(q^2 + p^2) + b(2pq + p^2)

; Now note that
; a - b = (a-b)p + bq

; So applying our algorithm twice is just the same as doing it once
; with new coefficients q' and p', where
; q' = 2pq + q^2
; p' = q^2 + p^2

; Now we are in a position to calculate fib numbers in log time

(define (even? n)
  (= (remainder n 2) 0))

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* q q) (* p p))
                   (+ (* p q) (* p q) (* q q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(fib 7)
