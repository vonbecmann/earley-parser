private operations
addEdgeSourceNodes: firstItem and: secondItem toTargetNode: targetItem
	firstItem isPredicted
		ifFalse: [ builder gatherSourceNode: firstItem asNode ].
	builder gatherSourceNode: secondItem asNode.
	builder gatherTargetNode: targetItem asNode.
	builder addEdgeLabeled: targetItem rule