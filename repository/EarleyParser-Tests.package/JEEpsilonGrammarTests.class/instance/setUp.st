running
setUp
	grammar := [ 
	| S A E a |
	S := JENonterminal named: 'S'.
	A := JENonterminal named: 'A'.
	E := JENonterminal named: 'E'.
	a := JETerminal character: $a.
	JEGrammar
		basedOn:
			{ S is: A , A , A , A.
			  A is: E.
			  A is: a.
			  E is_epsilon} ] value