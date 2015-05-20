private operations
addEdgeSourceNodes: firstItem word: word toTargetNode: targetItem
	firstItem isPredicted
		ifFalse: [ builder gatherSourceNode: firstItem asConstituent ].
	builder
		gatherSourceNode:
			((JEToken this: word matches: firstItem symbolAtDot)
				startedAt: firstItem endChart number
				andEndedAt: targetItem endChart number).
	builder gatherTargetNode: targetItem asConstituent.
	builder addEdgeLabeled: targetItem rule