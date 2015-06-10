private operations
addEdgeSourceNodes: firstItem word: word toTargetNode: targetItem
	| terminal |
	terminal := firstItem symbolAtDot 
							startedAt: firstItem endChart number andEndedAt: targetItem endChart number.
	builder gatherSourceNode: word.
	builder gatherTargetNode: terminal.
	builder addEdgeLabeled: #matches.
	firstItem isPredicted
		ifFalse: [ builder gatherSourceNode: firstItem asNode ].
	builder gatherSourceNode: terminal.
	builder gatherTargetNode: targetItem asNode.
	builder addEdgeLabeled: targetItem rule