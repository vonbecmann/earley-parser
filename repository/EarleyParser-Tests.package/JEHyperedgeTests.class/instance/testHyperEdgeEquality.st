tests
testHyperEdgeEquality
	| root sourceNode one another |
	root := JEHypernode model: 'Start'.
	sourceNode := JEHypernode model: 'P'.
	
	one := JEBDirectedHyperedge sourceNodes: {sourceNode} targetNode: root.
	another := JEBDirectedHyperedge sourceNodes: {sourceNode} targetNode: root.
	
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another
	