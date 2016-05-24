private operations
addEdgeSourceNodes: firstItem and: secondItem toTargetNode: targetItem

	secondItem isEpsilon
		ifTrue: [ secondItem addEdgeWithSources: #() ].

	targetItem
		addEdgeWithSources:
			(firstItem isPredicted
				ifTrue: [ {secondItem node} ]
				ifFalse: [ {firstItem node.	secondItem node} ])