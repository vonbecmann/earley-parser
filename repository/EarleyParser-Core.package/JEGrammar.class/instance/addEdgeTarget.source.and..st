private
addEdgeTarget: fromItem source: anObject and: previousItem
	builder gatherTargetNode: fromItem.
	previousItem isPredicted
		ifFalse: [ builder gatherSourceNode: previousItem ].
	builder gatherSourceNode: anObject.
	builder addEdge