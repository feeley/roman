(define (integer->roman n)

  ;; n must be between 1 and 3999

  (define (digit d1 d5 d10 power10)
    (let ((d (modulo (quotient n power10) 10)))
      (cond ((<= d 3)
             (make-string d d1))
            ((= d 4)
             (string d1 d5))
            ((<= d 8)
             (string-append (string d5) (make-string (- d 5) d1)))
            (else
             (string d1 d10)))))

  (string-append
   (digit #\M #\_ #\_ 1000)
   (digit #\C #\D #\M 100)
   (digit #\X #\L #\C 10)
   (digit #\I #\V #\X 1)))
