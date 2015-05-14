tests
testHyperEdgeEquality
	| Start P first fourth firstRule secondRule root sourceNode one another |
	Start := JENonterminal start.
	P := JENonterminal named: 'P'.
	first := JEChart number: 1.
	fourth := JEChart number: 4.
	firstRule := (Start body: {P}) dotAtEnd startedAt: first andEndedAt: fourth.
	secondRule := (P body: {P}) dotAtEnd startedAt: first andEndedAt: fourth.
	root := JEHypernode value: firstRule.
	sourceNode := JEHypernode value: secondRule.
	one := JEDirectedHyperedge sourceNodes: {sourceNode} targetNode: root.
	another := JEDirectedHyperedge sourceNodes: {sourceNode} targetNode: root.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash