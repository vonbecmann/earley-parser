private operations
addEdgeSourceNodes: firstItem word: word toTargetNode: targetItem

	| terminal |
	terminal := targetItem endChart
		addTerminalNode: (firstItem symbolAtDot startedAt: firstItem endChart number andEndedAt: targetItem endChart number).
	terminal addBackwardEdge: (JEDirectedHyperedge labeled: word sourceNodes: #() targetNode: terminal).

	targetItem
		addEdgeWithSources:
			(firstItem isPredicted
				ifTrue: [ {terminal} ]
				ifFalse: [ {firstItem node.	terminal} ])