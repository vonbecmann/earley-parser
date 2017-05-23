running
setUp
	first := JEColumn number: 1.
	rule := JERule
		head: (JENonterminal named: 'T')
		body: 	{(JENonterminal named: 'T'). (JETerminal character: $+). (JENonterminal named: 'P')}.
	item := nil