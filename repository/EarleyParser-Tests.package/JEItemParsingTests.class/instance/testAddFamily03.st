tests
testAddFamily03
	| first middle last rule target previous scanned family |
	first := JEColumn number: 1.
	middle := JEColumn number: 3.
	last := JEColumn number: 4.
	rule := JERule
		head: (JENonterminal named: 'F')
		body: {(JENonterminal named: 'G'). (JETerminal character: $H)}.
		
	previous := (rule dotAt: 2) startedAt: first andEndedAt: middle.
	scanned := JETerminalItem given: (JETerminal character: $H) word: $H startedAt: middle andEndedAt: last.
		
	target := rule dotAtEnd startedAt: first andEndedAt: last.
	
	family := previous newFamilyWith: scanned.

	target addFamily: family.
	target addFamilyWith: previous and: scanned.
	target addFamilyWith: previous and: scanned.

		
	self assert: target familiesSize equals: 1.
	self assert: (target families includes: family)