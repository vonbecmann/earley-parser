running
setUp
	grammar := [ 
	| E Q F a div mul |
	E := JENonterminal named: 'E'.
	Q := JENonterminal named: 'Q'.
	F := JENonterminal named: 'F'.
   a := JETerminal character: $a.
	div := JETerminal character: $/.
	mul := JETerminal character: $*.
	
	JEGrammar
		basedOn:
			{ E is: E , Q , F.
			  E is: F.
			  F is: a.
			  Q is: mul.  
			  Q is: div.
			  Q is_epsilon.
			  } ] value