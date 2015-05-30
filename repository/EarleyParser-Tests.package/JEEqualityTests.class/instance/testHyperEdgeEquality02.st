tests
testHyperEdgeEquality02
	| Start P T root one another sourceNode sourceNode2 |
	Start := JENonterminal start.
	P := JENonterminal named: 'P'.
	T := JENonterminal named: 'T'.
	root := Start startedAt: 1 andEndedAt: 4.
	sourceNode := P startedAt: 1 andEndedAt: 4.
	sourceNode2 := T startedAt: 1 andEndedAt: 4.
	one := JEDirectedHyperedge 
				labeled: (Start body: P) 
				sourceNodes: {sourceNode} 
				targetNode: root.
	another := JEDirectedHyperedge 
					labeled: (Start body: P) 
					sourceNodes: {sourceNode2} 
					targetNode: root.
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash