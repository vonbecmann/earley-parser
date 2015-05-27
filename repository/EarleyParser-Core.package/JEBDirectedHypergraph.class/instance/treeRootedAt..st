public
treeRootedAt: node
	"a backward directed tree with all backward path from node. 
	it's a binary shared packed parse forest. it's rank is 3"

	| aNode |
	aNode := nodes
		detect: [ :each | each = node ]
		ifNone: [ self error: node asString , ' is not a node of the hypergraph' ].
	^ self treeRootedAtNode: aNode