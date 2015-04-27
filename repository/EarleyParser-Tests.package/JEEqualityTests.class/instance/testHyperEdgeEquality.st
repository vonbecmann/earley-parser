tests
testHyperEdgeEquality
	| Start P first fourth one another |
	Start := JENonterminal named: 'Start'.
	P := JENonterminal named: 'P'.
	first := JEChart number: 1.
	fourth := JEChart number: 4.
	one := JEHyperedge
		sourceNodes: {(JEHNode labeled: P from: first to: fourth)} asSet
		targetNode: (JEHNode labeled: Start from: first to: fourth).
	another := JEHyperedge
		sourceNodes: {(JEHNode labeled: P from: first to: fourth)} asSet
		targetNode: (JEHNode labeled: Start from: first to: fourth).
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash