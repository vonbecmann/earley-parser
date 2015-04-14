running
setUp
	grammar :=
[ 	| X Y a b e d |
	X := JENonterminal named: 'X'.
	Y := JENonterminal named: 'Y'.
	a := JETerminal symbol: #a.
	b := JETerminal symbol: #b.
	e := JETerminal symbol: #e.
	d := JETerminal symbol: #d.
	JEGrammar
		basedOn:
		{	X body: { a }.
			X body: { X. b }.
			X body: { Y. a }.
			Y body: { e }.
			Y body: { Y. d. Y } } ] value