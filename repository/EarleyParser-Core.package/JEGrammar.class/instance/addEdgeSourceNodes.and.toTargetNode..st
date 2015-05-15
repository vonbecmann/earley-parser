private
addEdgeSourceNodes: firstItem and: secondItem toTargetNode: targetItem
	firstItem isPredicted
		ifFalse: [ builder gatherSourceNode: firstItem ].
	builder gatherSourceNode: secondItem.
	builder gatherTargetNode: targetItem.
	builder addEdge