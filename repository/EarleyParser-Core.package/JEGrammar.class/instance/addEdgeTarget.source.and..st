private
addEdgeTarget: fromItem source: anObject and: previousItem
	builder gatherTargetNode: fromItem.
	builder gatherSourceNode: anObject.
	previousItem isPredicted
		ifFalse: [ builder gatherSourceNode: previousItem ].
	builder addEdge