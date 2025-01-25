#lang racket

(provide custom-params markdown->html)

(require commonmark
         racket/path)


;; defines a function, which returns a hash, where the keys are the
;; --key=value parameters you called the CLI with
(define custom-params (make-parameter (hash)))


;; parses a markdown file as HTML
(define (markdown->html markdown-path)
  (let* ([markdown-string (file->string (string->path markdown-path))]
         [doc (string->document markdown-string)])
    (document->html doc)))
