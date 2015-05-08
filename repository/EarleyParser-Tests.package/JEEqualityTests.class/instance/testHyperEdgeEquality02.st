tests
testHyperEdgeEquality02
	| Start P T first fourth root one another |
	Start := JENonterminal named: 'Start'.
	P := JENonterminal named: 'P'.
	T := JENonterminal named: 'T'.
	first := JEChart number: 1.
	fourth := JEChart number: 4.
	root := JEHypernode labeled: Start from: first to: fourth.
	one := JEDirectedHyperedge
					sourceNodes: {(JEHypernode labeled: P from: first to: fourth)}
					targetNode: root.
	another := JEDirectedHyperedge
					sourceNodes: {(JEHypernode labeled: T from: first to: fourth)}
					targetNode: root.
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash