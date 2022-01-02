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

(define (roman->integer str)

  (define pos 0)

  (define (digit d1 d5 d10)
    (let loop ((val 0))

      (define (accept new-val)
        (set! pos (+ pos 1))
        (loop new-val))

      (if (< pos (string-length str))
          (let ((d (string-ref str pos)))
            (cond ((char=? d d1)
                   (if (<= (modulo val 5) 2)
                       (accept (+ val 1))
                       val))
                  ((char=? d d5)
                   (if (<= val 1)
                       (accept (- 5 val))
                       val))
                  ((char=? d d10)
                   (if (= val 1)
                       (accept 9)
                       val))
                  (else
                   val)))
          val)))

  (define d1000 (digit #\M #\_ #\_))
  (define d100  (digit #\C #\D #\M))
  (define d10   (digit #\X #\L #\C))
  (define d1    (digit #\I #\V #\X))

  (and (= pos (string-length str))
       (> pos 0)
       (+ (* 1000 d1000)
          (* 100 d100)
          (* 10 d10)
          d1)))
