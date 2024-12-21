#lang sicp

; Recursive
(define (pascal row col) 
    (cond ((= col 1) 1)
          ((= col row) 1)
          ((< row 1) 0)
          ((< col 1) 0)
          ((< row col) 0)
          (else (+ (pascal (- row 1) (- col 1)) (pascal (- row 1) col)))))

(pascal 5 3)