private operations
addFamilyWith: previousItem word: word to: nextItem
	| terminal |
	terminal := nextItem end
		addTerminalItem:
			(JETerminalItem
				given: previousItem symbolAtDot
				word: word
				startedAt: previousItem end).

	self addFamilyWith: previousItem and: terminal to: nextItem