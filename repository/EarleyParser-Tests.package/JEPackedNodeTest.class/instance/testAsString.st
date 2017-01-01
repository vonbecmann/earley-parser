tests
testAsString
	self
		assert:
			(JEPackedNode
				model:
					((JERule head: (JENonterminal named: 'A') body: #()) dotAtEnd
						startedAt: (JEItemSet number: 10))) asString
		equals: '([A: ·. @ 10])'