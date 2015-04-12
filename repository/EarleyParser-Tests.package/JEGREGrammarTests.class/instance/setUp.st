running
setUp
	grammar :=
[ 	| X Y a b e d |
	X := JENonterminal named: 'X'.
	Y := JENonterminal named: 'Y'.
	a := JETerminal for: #a.
	b := JETerminal for: #b.
	e := JETerminal for: #e.
	d := JETerminal for: #d.
	JEGrammar
		basedOn:
		{	X body: { a }.
			X body: { X. b }.
			X body: { Y. a }.
			Y body: { e }.
			Y body: { Y. d. Y } } ] value