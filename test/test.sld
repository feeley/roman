(define-library (test)

  (import (.. roman) ;; relative reference to roman library
          (srfi 64))

  (begin

    ;; test integer->roman

    (test-equal "I"         (integer->roman 1))
    (test-equal "XX"        (integer->roman 20))
    (test-equal "CIV"       (integer->roman 104))
    (test-equal "CCCLXXX"   (integer->roman 380))
    (test-equal "MCMVII"    (integer->roman 1907))
    (test-equal "MMMCMXCIX" (integer->roman 3999))))
