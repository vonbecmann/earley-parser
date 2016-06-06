private operations
buildTreeRootedAtNode: aNode
	"
	a backward directed tree with all backward path from aNode. 
	it's a binary shared packed parse forest. it's rank is 3.
	breadth-first search.
	"

	| builder visited queue |
	builder := JEHypergraphBuilder new.
	visited := IdentityDictionary new.
	queue := JELinkedList with: aNode.
	visited at: aNode put: true.
	[ queue isEmpty ]
		whileFalse: [ | packed |
			packed := queue removeFirst.
			packed families
				do: [ :family | 
					builder 
						addEdgeSourceNodes: (family members collect: [ :each | each model ]) 
						targetNode: packed model.
					family members
						reject: [ :node | visited at: node ifAbsent: [ false ] ]
						thenDo: [ :node | 
							visited at: node put: true.
							queue addLast: node ] ] ].
	builder rootNode: aNode model.
	^ builder build