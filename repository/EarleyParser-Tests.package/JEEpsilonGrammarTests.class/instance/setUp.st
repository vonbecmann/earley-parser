running
setUp
	grammar := [ 
	| S A B E a |
	S := JENonterminal named: 'S'.
	A := JENonterminal named: 'A'.
	B := JENonterminal named: 'B'.
	E := JENonterminal named: 'E'.
	a := JETerminal character: $a.
	JEGrammar
		basedOn:
			{ S is: A , B , A , B.
			  A is: E.
			  A is: a.
			  B is: E.
			  E is_epsilon} ] value