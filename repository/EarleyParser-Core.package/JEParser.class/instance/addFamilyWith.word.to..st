private operations
addFamilyWith: item word: word to: nextItem
	| terminal |
	terminal := nextItem endChart
		addTerminalNode:
			(JEPackedNode
				labeled: word
				model: (JEHypernode model: (item symbolAtDot startedAt: item endChart number andEndedAt: nextItem endChart number))).
	terminal addFamily: JELinkedList new.
	
	nextItem
		addFamily:
			(item isPredicted
				ifTrue: [ JELinkedList with: terminal ]
				ifFalse: [ JELinkedList with: item node with: terminal ])