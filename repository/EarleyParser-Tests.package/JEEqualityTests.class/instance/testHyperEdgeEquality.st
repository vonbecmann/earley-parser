tests
testHyperEdgeEquality
	| Start P root sourceNode one another |
	Start := JENonterminal start.
	P := JENonterminal named: 'P'.
	root := JEHypernode value: (JEConstituent value: Start start: 1 end: 4).
	sourceNode := JEHypernode value: (JEConstituent value: P start: 1 end: 4).
	one := JEDirectedHyperedge 
					labeled: (Start body: {P}) 
					sourceNodes: {sourceNode} 
					targetNode: root.
	another := JEDirectedHyperedge 
					labeled: (Start body: {P}) 
					sourceNodes: {sourceNode} 
					targetNode: root.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash