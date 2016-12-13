instance creation
BP
	"has unbounded direct ambiguity, it's time is n ^ 2. page 40."
	^ [ | P M N a |
		P := JENonterminal named: 'P'.
		M := JENonterminal named: 'M'.
		N := JENonterminal named: 'N'.
		a := JETerminal character: $a.
		JEGrammar
			basedOn:
			{	{P. {M. N}}.
				{M. {}}. {M. {M. a}}.
				{N. {}}. {N. {N. a}}. } ] value