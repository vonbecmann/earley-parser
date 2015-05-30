running
setUp
	grammar :=
[ 	| X Y a b e d |
	X := JENonterminal named: 'X'.
	Y := JENonterminal named: 'Y'.
	a := JETerminal character: $a.
	b := JETerminal character: $b.
	e := JETerminal character: $e.
	d := JETerminal character: $d.
	JEGrammar
		basedOn:
		{	X body: a.
			X body: X, b.
			X body: Y, a.
			Y body: e.
			Y body: Y, d, Y } ] value