#lang racket/base

(require "helpers.rkt"
         racket/cmdline
         racket/match
         racket/list
         racket/runtime-path
         scribble/render
         scribble/core
         scribble/text
         racket/file
         scribble/core
         syntax/parse/define)

(define (parse-custom-args args)
  (let loop ([args args]
             [params (hash)])
    (match args
      ['() params]
      [(cons (regexp #rx"^--([^=]+)=(.*)$" (list _ name value)) rest)
       (loop rest (hash-set params (string->symbol name) value))]
      [_ (error 'parse-custom-args "Invalid argument format: ~a" (first args))])))


;; Main function to process the Scribble file
(define (execute-scribble-file input-file params-in)
    (custom-params params-in)
    (dynamic-require input-file #f))


(define (main)
  (command-line
   #:program "scribble-runner"
   #:usage-help "Run a Scribble file with custom parameters"
   #:args (scribble-file . custom-args)
   (when (null? scribble-file)
     (error 'main "No Scribble file specified"))

   (define custom-params-parsed (parse-custom-args custom-args))

   (execute-scribble-file
    (string->path scribble-file)
    custom-params-parsed)
))

(main)
