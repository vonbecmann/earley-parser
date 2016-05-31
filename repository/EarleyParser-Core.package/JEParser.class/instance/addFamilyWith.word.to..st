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
				ifTrue: [ JEFamily with: terminal node ]
				ifFalse: [ JEFamily with: item node with: terminal node ])