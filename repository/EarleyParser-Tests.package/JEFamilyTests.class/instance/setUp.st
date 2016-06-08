running
setUp
	aPackedItem := (JERule head: (JENonterminal named: 'A') body: {}) dotAtEnd
		startedAt: (JEChart number: 1)
		andEndedAt: (JEChart number: 2).
	anotherPackedItem := (JERule head: (JENonterminal named: 'B') body: {}) dotAtEnd
		startedAt: (JEChart number: 2)
		andEndedAt: (JEChart number: 3)