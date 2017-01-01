tests
testAddFamily
	| first middle last rule target previous complete family |
	first := JEItemSet number: 1.
	middle := JEItemSet number: 3.
	last := JEItemSet number: 4.
	rule := JERule
		head: (JENonterminal named: 'F')
		body: {(JENonterminal named: 'G'). (JENonterminal named: 'H')}.
		
	previous := (rule dotAt: 2) startedAt: first andEndedAt: middle.
	complete := (JERule head: (JENonterminal named: 'H') body: {(JENonterminal named: 'I')}) dotAtEnd startedAt: middle andEndedAt: last.
	target := rule dotAtEnd startedAt: first andEndedAt: last.
	
	family := JEFamily with: previous node with: complete node.

	target addFamily: family.

	self assert: target node familiesSize equals: 1.
	self assert: (target node families detect: [ :each | each = family ] ifFound: [ true ] ifNone: [ false ])