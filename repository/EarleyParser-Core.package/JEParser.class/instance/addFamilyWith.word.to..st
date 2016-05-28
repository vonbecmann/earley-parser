private operations
addFamilyWith: item word: word to: nextItem
	| terminal |
	terminal := nextItem endChart
		addTerminalNode:
			(JEPair
				first: (JEHypernode model: (item symbolAtDot startedAt: item endChart number andEndedAt: nextItem endChart number))
				second: word).
	nextItem
		addFamily:
			(item isPredicted
				ifTrue: [ JELinkedList with: terminal ]
				ifFalse: [ JELinkedList with: item node with: terminal ])