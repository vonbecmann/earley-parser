tests
testHyperEdgeEquality03
	| root root2 sourceNode one another |
	root := JEHypernode model: 'Start'.
	root2 := JEHypernode model: 'Start2'.
	sourceNode := JEHypernode model: 'P'.
	
	one := JEDirectedHyperedge sourceNodes: {sourceNode} targetNode: root.
	another := JEDirectedHyperedge sourceNodes: {sourceNode} targetNode: root2.
	
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another
	