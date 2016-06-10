private operations
addFamilyWith: previousItem word: word to: nextItem
	| terminal |
	terminal := nextItem endChart
		addTerminalItem:
			(JETerminalItem
				given: previousItem symbolAtDot
				word: word
				startedAt: previousItem endChart
				andEndedAt: nextItem endChart).
	terminal node addFamily: JEFamily empty.
	nextItem
		addFamily:
			(previousItem isPredicted
				ifTrue: [ JEFamily with: terminal node ]
				ifFalse: [ JEFamily with: previousItem node with: terminal node ])