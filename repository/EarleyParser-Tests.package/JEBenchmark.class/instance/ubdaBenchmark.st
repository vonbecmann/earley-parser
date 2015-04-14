public
ubdaBenchmark
	| n words grammar |
	n := 400.
	words := Array new: n.
	words from: 1 to: n put: #x.
	grammar := [ | A x |
	A := JENonterminal named: 'A'.
	x := JETerminal symbol: #x.
	JEGrammar
		basedOn:
		{ A body: { x }.
		  A body: { A. A } } ] value.
	grammar accepts: words