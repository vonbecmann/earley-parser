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
	
	family := JEFamily with: previous node with: scanned node.

	target addFamily: family.
	target addFamily: (JEFamily with: previous node with: scanned node).
	target addFamily: (JEFamily with: previous node with: scanned node).
		
	self assert: target node familiesSize equals: 1.
	self assert: (target node families detect: [ :each | each = family ] ifFound: [ true ] ifNone: [ false ])