private operations
buildTreeRootedAtNode: aNode
	"
	a backward directed tree with all backward path from aNode. 
	it's a binary shared packed parse forest. it's rank is 3.
	breadth-first search.
	"

	| visited visitedEdges visitedNodes queue |
	visited := IdentityDictionary new.
	visitedEdges := JELinkedList new.
	visitedNodes := JELinkedList new.
	queue := JELinkedList with: aNode.
	visited at: aNode put: true.
	[ queue isEmpty ]
		whileFalse: [ 
			| packed |
			packed := queue removeFirst.
			packed model class == JEHypernode
				ifTrue: [ 
					visitedNodes add: packed model.
					packed families
						do: [ :family | 
							| sourceNodes |
							sourceNodes := family
								collect: [ :each | 
									each model class == JEHypernode
										ifTrue: [ each model ]
										ifFalse: [ each model first ] ].
							visitedEdges add: (JEDirectedHyperedge labeled: packed model model rule asDefined sourceNodes: sourceNodes targetNode: packed model) ] ].
			packed model class == JEPair
				ifTrue: [ 
					visitedNodes add: packed model first.
					visitedEdges add: (JEDirectedHyperedge labeled: packed model second sourceNodes: #() targetNode: packed model first) ].
			packed families
				do: [ :family | 
					family
						reject: [ :node | visited at: node ifAbsent: [ false ] ]
						thenDo: [ :node | 	visited at: node put: true. queue addLast: node ] ] ].
	^ JEBTreeHypergraph root: aNode model nodes: visitedNodes hyperedges: visitedEdges