tests
testHyperEdgeEquality04
	| root one another |
	root := JEHypernode model: 'Start'.
	
	one := JEDirectedHyperedge labeled: 'Start is empty' targetNode: root.
	another := JEDirectedHyperedge labeled: 'or Start is empty' targetNode: root.
	
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another
	