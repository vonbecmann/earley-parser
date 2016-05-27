private operations
addEdgeSourceNodes: firstItem word: word toTargetNode: targetItem
	| terminal |
	terminal := targetItem endChart
		addTerminalNode:
			(JEPair
				first: (JEHypernode model: (firstItem symbolAtDot startedAt: firstItem endChart number andEndedAt: targetItem endChart number))
				second: word).
	targetItem
		addFamily:
			(firstItem isPredicted
				ifTrue: [ JELinkedList with: terminal ]
				ifFalse: [ JELinkedList with: firstItem node with: terminal ])