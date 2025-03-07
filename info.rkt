#lang setup/infotab
(define name "scribble_gen")
(define version "1.0.1")
(define deps '("base"
               "scribble-lib"
               "commonmark-lib"))
(define files (list "scribble_gen.rkt" "helpers.rkt"))
(define racket-launcher-names '("scribble_gen"))
(define racket-launcher-libraries '("scribble_gen.rkt"))
