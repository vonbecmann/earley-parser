public
treeRootedAt: anObject
	| aNode |
	aNode := nodes
		detect: [ :each | each value = anObject ]
		ifNone: [ self error: anObject asString , ' is not a node of the hypergraph' ].
	^ self treeRootedAtNode: aNode