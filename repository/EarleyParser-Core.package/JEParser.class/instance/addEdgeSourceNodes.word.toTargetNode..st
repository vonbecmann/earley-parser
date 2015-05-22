private operations
addEdgeSourceNodes: firstItem word: word toTargetNode: targetItem
	builder 
		gatherSourceNode: 
				(JEConstituent 
					value: word 
					start: firstItem endChart number 
					end: targetItem endChart number).
	builder 
		gatherTargetNode: 
				(firstItem symbolAtDot
					startedAt: firstItem endChart number
					andEndedAt: targetItem endChart number).
	builder addEdgeLabeled: #matches.

	firstItem isPredicted
		ifFalse: [ builder gatherSourceNode: firstItem asConstituent ].
	builder
		gatherSourceNode:
			(firstItem symbolAtDot
				startedAt: firstItem endChart number
				andEndedAt: targetItem endChart number).
	builder gatherTargetNode: targetItem asConstituent.
	builder addEdgeLabeled: targetItem rule