tests
testHyperEdgeEquality
	| Start P first fourth root one another |
	Start := JENonterminal named: 'Start'.
	P := JENonterminal named: 'P'.
	first := JEChart number: 1.
	fourth := JEChart number: 4.
	root := JEHNode labeled: Start from: first to: fourth.
	one := JEDirectedHyperedge
		sourceNodes: {(JEHNode labeled: P from: first to: fourth)} asOrderedCollection
		targetNode: root.
	another := JEDirectedHyperedge
		sourceNodes: {(JEHNode labeled: P from: first to: fourth)} asOrderedCollection
		targetNode: root.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash