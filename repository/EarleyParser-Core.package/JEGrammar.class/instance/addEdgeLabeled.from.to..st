private
addEdgeLabeled: anObject from: fromItem to: previousItem
	builder gatherTargetNode: fromItem.
	builder gatherSourceNode: anObject.
	previousItem isPredicted
		ifFalse: [ builder gatherSourceNode: previousItem ].
	builder addEdge