public
treeRootedAt: node
	| aNode |
	aNode := nodes
		detect: [ :each | each = node ]
		ifNone: [ self error: node asString , ' is not a node of the hypergraph' ].
	^ self treeRootedAtNode: aNode