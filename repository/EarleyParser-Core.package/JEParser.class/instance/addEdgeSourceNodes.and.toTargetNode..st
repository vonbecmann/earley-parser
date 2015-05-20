private
addEdgeSourceNodes: firstItem and: secondItem toTargetNode: targetItem
	firstItem isPredicted
		ifFalse: [ builder gatherSourceNode: firstItem asConstituent ].
	builder gatherSourceNode: secondItem asConstituent.
	builder gatherTargetNode: targetItem asConstituent.
	builder addEdgeLabeled: targetItem rule