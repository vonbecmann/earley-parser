tests
testHyperEdgeEquality
	| Start P first fourth root sourceNode one another |
	Start := JENonterminal named: 'Start'.
	P := JENonterminal named: 'P'.
	first := JEChart number: 1.
	fourth := JEChart number: 4.
	root := JEHypernode labeled: Start from: first to: fourth.
	sourceNode := JEHypernode labeled: P from: first to: fourth.
	one := JEDirectedHyperedge 
					sourceNodes: {sourceNode} 
					targetNode: root.
	another := JEDirectedHyperedge 
					sourceNodes: {sourceNode} 
					targetNode: root.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash