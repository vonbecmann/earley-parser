public
treeRootedAt: anObject
	"a backward directed tree with all backward path from anObject. 
	it's a binary shared packed parse forest. it's rank is 3"

	| aNode |
	aNode := nodes
		detect: [ :each | each model = anObject ]
		ifNone: [ self error: anObject asString , ' is not a node of the hypergraph' ].
	^ self treeRootedAtNode: aNode