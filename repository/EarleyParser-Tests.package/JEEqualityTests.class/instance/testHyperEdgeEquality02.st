tests
testHyperEdgeEquality02
	| Start P T first fourth one another |
	Start := JENonterminal named: 'Start'.
	P := JENonterminal named: 'P'.
	T := JENonterminal named: 'T'.
	first := JEChart number: 1.
	fourth := JEChart number: 4.
	one := JEHyperedge
		sourceNodes: {(JEHNode labeled: P from: first to: fourth)} asSet
		targetNode: (JEHNode labeled: Start from: first to: fourth).
	another := JEHyperedge
		sourceNodes: {(JEHNode labeled: T from: first to: fourth)} asSet
		targetNode: (JEHNode labeled: Start from: first to: fourth).
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash