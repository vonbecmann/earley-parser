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
	self addFamilyWith: previousItem and: terminal to: nextItem