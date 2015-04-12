public
palBenchmark
	| n words grammar maxOdd |
	n := 1000.
	maxOdd := ((1 to: n) select: [ :each | each odd ]) detectMax: [ :each | each ].
	words := Array new: maxOdd.
	words from: 1 to: maxOdd put: #x.
	grammar := [	| A x |
	A := JENonterminal named: 'A'.
	x := JETerminal for: #x.
	JEGrammar
		basedOn: 
		{ A body: { x }.
		  A body: { x. A. x } } ] value.
	grammar accepts: words