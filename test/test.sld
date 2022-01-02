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
    (test-equal "MMMCMXCIX" (integer->roman 3999))

    ;; test roman->integer

    (test-equal 1    (roman->integer "I"))
    (test-equal 20   (roman->integer "XX"))
    (test-equal 104  (roman->integer "CIV"))
    (test-equal 380  (roman->integer "CCCLXXX"))
    (test-equal 1907 (roman->integer "MCMVII"))
    (test-equal 3999 (roman->integer "MMMCMXCIX"))
    (test-equal #f   (roman->integer "CIL"))
    (test-equal #f   (roman->integer "Z"))
    (test-equal #f   (roman->integer " I"))
    (test-equal #f   (roman->integer "I "))
    (test-equal #f   (roman->integer " I "))
    (test-equal #f   (roman->integer " "))
    (test-equal #f   (roman->integer ""))))
