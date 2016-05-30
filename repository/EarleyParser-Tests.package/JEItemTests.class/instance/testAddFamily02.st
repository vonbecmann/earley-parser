tests
testAddFamily02
	| first middle last rule target previous scanned family |
	first := JEChart number: 1.
	middle := JEChart number: 3.
	last := JEChart number: 4.
	rule := JERule
		head: (JENonterminal named: 'F')
		body:
			{(JENonterminal named: 'G').
			(JETerminal character: $H)}.
	previous := (rule dotAt: 2) startedAt: first andEndedAt: middle.
	scanned := JEPackedNode
		labeled: $H
		model: (JEHypernode model: (JETerminalItem given: (JETerminal character: $H) word: $H startedAt: middle andEndedAt: last)).
	target := rule dotAtEnd startedAt: first andEndedAt: last.
	
	family := JELinkedList with: previous node with: scanned.
	
	target addFamily: (JELinkedList with: previous node with: scanned).
	
	self assert: target node familiesSize equals: 1.
	self assert: (target node families detect: [ :each | each = family ] ifFound: [ true ] ifNone: [ false ])