private operations
addEdgeSourceNodes: firstItem and: secondItem toTargetNode: targetItem
	secondItem isEmpty
		ifTrue: [ 
			builder gatherTargetNode: secondItem asNode.
			builder addEdgeLabeled: secondItem rule ].
	firstItem isPredicted
		ifFalse: [ builder gatherSourceNode: firstItem asNode ].
	builder gatherSourceNode: secondItem asNode.
	builder gatherTargetNode: targetItem asNode.
	builder addEdgeLabeled: targetItem rule