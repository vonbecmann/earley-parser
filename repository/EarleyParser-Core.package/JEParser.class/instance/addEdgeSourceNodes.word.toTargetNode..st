private operations
addEdgeSourceNodes: firstItem word: word toTargetNode: targetItem
	"| terminal |
	terminal := firstItem symbolAtDot 
							startedAt: firstItem endChart number andEndedAt: targetItem endChart number.
	builder gatherTargetNode: terminal.
	builder addEdgeLabeled: word.
	firstItem isPredicted
		ifFalse: [ builder gatherSourceNode: firstItem asNode ].
	builder gatherSourceNode: terminal.
	builder gatherTargetNode: targetItem asNode.
	builder addEdgeLabeled: targetItem rule"

	| terminal |
	terminal := self
		addNode: (firstItem symbolAtDot startedAt: firstItem endChart number andEndedAt: targetItem endChart number).
	terminal addBackwardEdge: (JEDirectedHyperedge labeled: word sourceNodes: #() targetNode: terminal).
	targetItem
		addEdgeWithSources:
			(firstItem isPredicted
				ifTrue: [ {terminal} ]
				ifFalse: [ {firstItem node.	terminal} ])