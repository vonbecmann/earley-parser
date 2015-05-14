tests
testHyperEdgeEquality02
	| Start P T first fourth root one another sourceNode sourceNode2 |
	Start := JENonterminal start.
	P := JENonterminal named: 'P'.
	T := JENonterminal named: 'T'.
	first := JEChart number: 1.
	fourth := JEChart number: 4.
	root := JEHypernode value: ((Start body: {P}) dotAtEnd startedAt: first andEndedAt: fourth).
	sourceNode := JEHypernode value: ((P body: {P}) dotAtEnd startedAt: first andEndedAt: fourth).
	sourceNode2 := JEHypernode value: ((P body: {T}) dotAtEnd startedAt: first andEndedAt: fourth).
	one := JEDirectedHyperedge sourceNodes: {sourceNode} targetNode: root.
	another := JEDirectedHyperedge sourceNodes: {sourceNode2} targetNode: root.
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash