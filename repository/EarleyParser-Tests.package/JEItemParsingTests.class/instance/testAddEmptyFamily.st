tests
testAddEmptyFamily
	| item first |
	first := JEColumn number: 1.
	item := (JERule head: (JENonterminal named: 'F') body: {}) dotAtEnd startedAt: first.
	item addFamily: JEFamily empty.
	self assert: item node familiesSize equals: 1