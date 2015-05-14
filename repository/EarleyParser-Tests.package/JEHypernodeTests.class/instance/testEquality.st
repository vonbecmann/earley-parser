tests
testEquality
	| Start A first fourth item one another |
	Start := JENonterminal start.
	A := JENonterminal named: 'A'.
	first := JEChart number: 1.
	fourth := JEChart number: 4.
	item := (Start body: {A}) dotAtEnd startedAt: first andEndedAt: fourth.
	one := JEHypernode value: item.
	another := JEHypernode value: item.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash