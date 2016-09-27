running
setUp
	parentNode := ((JERule 
							head: (JENonterminal named: 'C') 
							body: {(JENonterminal named: 'A'). (JENonterminal named: 'B')}) dotAtEnd
		startedAt: (JEChart number: 1)
		andEndedAt: (JEChart number: 3)) node.
	firstPackedNode := ((JERule head: (JENonterminal named: 'A') body: {}) dotAtEnd
		startedAt: (JEChart number: 1)
		andEndedAt: (JEChart number: 2)) node.
	secondPackedNode := ((JERule head: (JENonterminal named: 'B') body: {}) dotAtEnd
		startedAt: (JEChart number: 2)
		andEndedAt: (JEChart number: 3)) node