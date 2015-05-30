instance creation
AE
	"Arithmetic Expressions. page 15"
	^ [ | E T P plus star a |
		E := JENonterminal named: 'E'.
		T := JENonterminal named: 'T'.
		P := JENonterminal named: 'P'.
		plus := JETerminal character: $+.
		star := JETerminal character: $*.
		a := JETerminal character: $a.
		JEGrammar
			basedOn:
			{	E body: T.
		 		E body: E, plus, T.
	 			T body: P.
  		 		T body: T, star, P.
				P body: a } ] value