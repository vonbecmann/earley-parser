public
palBenchmark
	| n words grammar maxOdd A x|
	n := 1000.
	maxOdd := ((1 to: n) select: [ :each | each odd ]) detectMax: [ :each | each ].
	words := Array new: maxOdd.
	words from: 1 to: maxOdd put: #x.
	A := JENonterminal named: #A.
	x := JETerminal for: #x.
	grammar := JEGrammar
		on:
{
A body: { x }.
A body: { x. A. x }
}.
	grammar accepts: words