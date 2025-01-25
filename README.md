Scribble-gen, an easy interface for [Scribble](https://docs.racket-lang.org/scribble/index.html)
=================


Sometimes I have a template where I want to fill in the blanks via the command line. Scribble-gen lets me do that!

Installation
===========

When I've used this package more - ie when I stop adding helpers - I'll distribute it better. For right now you'll have to clone and install it yourself.

Usage
===========

Step 1: Create your scribble document
------------

I like scribble/text, but if you want to use Scribble the markup language `scribble_gen` will work fine too.

```racket
#lang scribble/text
@(require scribble_gen/helpers)

Hello, @(hash-ref (custom-params) 'entity),

```

We'll save it to temp.rkt.

Step 2: Render it on the command line
-------------

`scribble-gen temp.rkt --entity=World`

Outputs:

Hello, World

Examples
==================

See the examples folder to see `scribble_gen` in action!

scribble_gen helpers Reference
===================

The Scribble_Gen Helpers library brings the following helper functions/exports. The awesome thing about Scribble, of course, is you're not limited to the helpers here, just `include` your own file of Racket too!

`custom_params`
-----------

A hash where every key corresponds to the command line parameter names, and key's values equals the value passed in.


`markdown->html`
-----------

Given a string - which is a path to a file - render that file using [CommonMark](https://docs.racket-lang.org/commonmark/), the Racket implementation of the [CommonMark standard](https://commonmark.org).

This makes `scribble_gen` very useful for inserting rendered markdown into some larger HTML structure.
