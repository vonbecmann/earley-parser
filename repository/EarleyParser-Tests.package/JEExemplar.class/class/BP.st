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
			{	P is: M, N.
				M is_epsilon. M is: M, a.
				N is_epsilon. N is: N, a. } ] value