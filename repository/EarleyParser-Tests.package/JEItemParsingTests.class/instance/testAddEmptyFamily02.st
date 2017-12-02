tests
testAddEmptyFamily02
	| item first |
	first := JEColumn number: 1.
	item := (JERule head: (JENonterminal named: 'F') body: {}) dotAtEnd startedAt: first.
	self assert: item familiesSize equals: 1