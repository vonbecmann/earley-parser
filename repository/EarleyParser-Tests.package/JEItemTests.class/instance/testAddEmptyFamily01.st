tests
testAddEmptyFamily01
	| item first |
	first := JEChart number: 1.
	item := (JERule head: (JENonterminal named: 'F') body: {}) dotAtEnd startedAt: first.
	item addFamily: JELinkedList new.
	item addFamily: JELinkedList new.
	item addFamily: JELinkedList new.
	self assert: item node familiesSize equals: 1