tests
testAddFamily
	| first middle last rule target previous complete family |
	first := JEColumn number: 1.
	middle := JEColumn number: 3.
	last := JEColumn number: 4.
	rule := JERule
		head: (JENonterminal named: 'F')
		body: {(JENonterminal named: 'G'). (JENonterminal named: 'H')}.
		
	previous := (rule dotAt: 2) startedAt: first andEndedAt: middle.
	complete := (JERule head: (JENonterminal named: 'H') body: {(JENonterminal named: 'I')}) dotAtEnd startedAt: middle andEndedAt: last.
	target := rule dotAtEnd startedAt: first andEndedAt: last.
	
	family := previous newFamilyWith: complete.

	target addFamily: family.

	self assert: target familiesSize equals: 1.
	self assert: (target families includes: family)