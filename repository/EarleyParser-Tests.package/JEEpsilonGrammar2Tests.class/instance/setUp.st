running
setUp
	grammar := [ 
	| A B C D E |
	A := JENonterminal named: 'A'.
	B := JENonterminal named: 'B'.
	C := JENonterminal named: 'C'.
	D := JENonterminal named: 'D'.
	E := JENonterminal named: 'E'.
	JEGrammar
		basedOn:
			{ A is: B.
			  B is: C.
			  C is: D.
			  D is: E.
			  E is_epsilon} ] value