instance creation
GRE
	^ [ 
	| X Y a b e d |
	X := JENonterminal named: 'X'.
	Y := JENonterminal named: 'Y'.
	a := JETerminal character: $a.
	b := JETerminal character: $b.
	e := JETerminal character: $e.
	d := JETerminal character: $d.
	JEGrammar
		basedOn:
			{ X is: a.
			  X is: X , b.
 			  X is: Y , a.
			  Y is: e.
			  Y is: Y , d , Y } ] value