running
setUp
	parentNode := ((JERule 
							head: (JENonterminal named: 'C') 
							body: {(JENonterminal named: 'A'). (JENonterminal named: 'B')}) dotAtEnd
		startedAt: (JEColumn number: 1)
		andEndedAt: (JEColumn number: 3)) node.
	firstPackedNode := ((JERule head: (JENonterminal named: 'A') body: {}) dotAtEnd
		startedAt: (JEColumn number: 1)
		andEndedAt: (JEColumn number: 2)) node.
	secondPackedNode := ((JERule head: (JENonterminal named: 'B') body: {}) dotAtEnd
		startedAt: (JEColumn number: 2)
		andEndedAt: (JEColumn number: 3)) node