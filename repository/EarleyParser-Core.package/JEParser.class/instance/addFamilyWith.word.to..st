private operations
addFamilyWith: item word: word to: nextItem
	| terminal |
	terminal := nextItem endChart
		addTerminalNode:
			(JEPackedNode
				labeled: word
				model:
					(JEHypernode
						model:
							(JETerminalItem
								given: item symbolAtDot
								word: word
								startedAt: item endChart
								andEndedAt: nextItem endChart))).
	terminal addFamily: JELinkedList new.
	nextItem
		addFamily:
			(item isPredicted
				ifTrue: [ JELinkedList with: terminal ]
				ifFalse: [ JELinkedList with: item node with: terminal ])