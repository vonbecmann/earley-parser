running
setUp
	grammar := 
[	| A x |
	A := JENonterminal named: 'A'.
	x := JETerminal symbol: #x.
	JEGrammar
		basedOn:
		{ A body: { x }.
		  A body: { x. A. x} } ] value