instance creation
UBDA
	"unbounded direct ambiguity. page 42.
	 It has unbounded direct ambiguity and no saving grace"
	^ [ | A x |
		A := JENonterminal named: 'A'.
		x := JETerminal character: $x.
		JEGrammar
			basedOn:
			{	{A. {x}}.
				{A. {A. A}} } ] value