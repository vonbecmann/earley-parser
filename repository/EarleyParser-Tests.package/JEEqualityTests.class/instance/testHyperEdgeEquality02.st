tests
testHyperEdgeEquality02
	| Start P T root one another sourceNode sourceNode2 |
	Start := JENonterminal start.
	P := JENonterminal named: 'P'.
	T := JENonterminal named: 'T'.
	root := JEConstituent value: Start start: 1 end: 4.
	sourceNode := JEConstituent value: P start: 1 end: 4.
	sourceNode2 := JEConstituent value: T start: 1 end: 4.
	one := JEDirectedHyperedge 
				labeled: (Start body: {P}) 
				sourceNodes: {sourceNode} 
				targetNode: root.
	another := JEDirectedHyperedge 
					labeled: (Start body: {P}) 
					sourceNodes: {sourceNode2} 
					targetNode: root.
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash