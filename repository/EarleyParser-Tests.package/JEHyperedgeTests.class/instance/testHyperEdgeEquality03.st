tests
testHyperEdgeEquality03
	| Start P root sourceNode one another |
	Start := JENonterminal start.
	P := JENonterminal named: 'P'.
	root := (Start startedAt: 1 andEndedAt: 4).
	sourceNode := (P startedAt: 1 andEndedAt: 4).
	one := JEDirectedHyperedge 
					labeled: ('a label') 
					sourceNodes: {sourceNode} 
					targetNode: root.
	another := JEDirectedHyperedge 
					labeled: ('another label') 
					sourceNodes: {sourceNode} 
					targetNode: root.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash