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
			{ X -> {a}.
			  X -> {X. b}.
 			  X -> {Y. a}.
			  Y -> {e}.
			  Y -> {Y. d. Y} } ] value