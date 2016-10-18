one level Van Wijngaarden Grammar (1VWG).

A 1VWG is a 4-tuple
	G = <S, T, E, P>, where

S = alphabet, a finite nonempty set of small syntactic marks, which does not contain the delimiters #($: $, $; $. $:)	.
T = symbols, a finite subset of (S)+.
E = initial notion belongs to (S)+.
P = productions, a finite subset of (((S+) - T), ((S*)*)).

Notation
x: y1, y2, ..., yn.

Example: 
expression: term.
expression: expression, plus symbol, term.
term: product.
term: term, star symbol, product.
product: letter a symbol.
plus symbol: $+.
star symbol: $*.
letter a symbol: $a.

