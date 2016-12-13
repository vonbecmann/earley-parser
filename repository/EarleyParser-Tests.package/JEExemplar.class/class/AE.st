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
			{	{E. {T}}.
		 		{E. {E. plus. T}}.
	 			{T. {P}}.
  		 		{T. {T. star. P}}.
				{P. {a}} } ] value