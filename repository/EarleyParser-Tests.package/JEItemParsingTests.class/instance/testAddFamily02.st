tests
testAddFamily02
	| first middle last rule target previous scanned family |
	first := JEItemSet number: 1.
	middle := JEItemSet number: 3.
	last := JEItemSet number: 4.
	rule := JERule
		head: (JENonterminal named: 'F')
		body: 	{(JENonterminal named: 'G'). (JETerminal character: $H)}.
			
	previous := (rule dotAt: 2) startedAt: first andEndedAt: middle.
	scanned := JETerminalItem given: (JETerminal character: $H) word: $H startedAt: middle andEndedAt: last.
	target := rule dotAtEnd startedAt: first andEndedAt: last.
	
	family := JEFamily with: previous node with: scanned node.
	
	target addFamily: (JEFamily with: previous node with: scanned node).
	
	self assert: target node familiesSize equals: 1.
	self assert: (target node families 
							detect: [ :each | each first = family first and: [ each second = family second ] ] 
							ifFound: [ true ] 
							ifNone: [ false ])