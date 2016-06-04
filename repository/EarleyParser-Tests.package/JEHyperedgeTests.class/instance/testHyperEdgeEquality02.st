tests
testHyperEdgeEquality02
	| root sourceNode sourceNode2 one another |
	root := JEHypernode model: 'Start'.
	sourceNode := JEHypernode model: 'P'.
	sourceNode2 := JEHypernode model: 'P2'.
	
	one := JEDirectedHyperedge sourceNodes: {sourceNode} targetNode: root.
	another := JEDirectedHyperedge sourceNodes: {sourceNode2} targetNode: root.
	
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another
	