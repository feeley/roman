(define-library (demo)

  (import (.. roman) ;; relative reference to roman library
          (scheme base)
          (scheme write)
          (only (srfi 1) iota))

  (begin
    (for-each (lambda (i)
                (let ((n (expt 2 i)))
                  (display n)
                  (display " is ")
                  (display (integer->roman n))
                  (display " in roman numerals\n")))
              (iota 7))))
