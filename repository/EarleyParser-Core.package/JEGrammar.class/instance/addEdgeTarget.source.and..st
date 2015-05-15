private
addEdgeTarget: fromItem source: previousItem and: anObject
	builder gatherTargetNode: fromItem.
	previousItem isPredicted
		ifFalse: [ builder gatherSourceNode: previousItem ].
	builder gatherSourceNode: anObject.
	builder addEdge