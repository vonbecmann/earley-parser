running
setUp
	parentNode := ((JERule 
							head: (JENonterminal named: 'C') 
							body: {(JENonterminal named: 'A'). (JENonterminal named: 'B')}) dotAtEnd
		startedAt: (JEItemSet number: 1)
		andEndedAt: (JEItemSet number: 3)) node.
	firstPackedNode := ((JERule head: (JENonterminal named: 'A') body: {}) dotAtEnd
		startedAt: (JEItemSet number: 1)
		andEndedAt: (JEItemSet number: 2)) node.
	secondPackedNode := ((JERule head: (JENonterminal named: 'B') body: {}) dotAtEnd
		startedAt: (JEItemSet number: 2)
		andEndedAt: (JEItemSet number: 3)) node