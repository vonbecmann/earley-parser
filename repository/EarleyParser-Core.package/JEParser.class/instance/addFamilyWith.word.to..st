private operations
addFamilyWith: item word: word to: nextItem
	| terminal |
	terminal := nextItem endChart
		addTerminalItem:
			(JETerminalItem
				given: item symbolAtDot
				word: word
				startedAt: item endChart
				andEndedAt: nextItem endChart).
	nextItem
		addFamily:
			(item isPredicted
				ifTrue: [ JELinkedList with: terminal node ]
				ifFalse: [ JELinkedList with: item node with: terminal node ])