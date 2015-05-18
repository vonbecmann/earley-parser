public
treeRootedAt: anObject
	| rootNode |
	rootNode := nodes
		detect: [ :each | each value = anObject ]
		ifNone: [ self error: anObject asString , ' is not a node of the hypergraph' ].
	^ self treeRootedAtNode: rootNode