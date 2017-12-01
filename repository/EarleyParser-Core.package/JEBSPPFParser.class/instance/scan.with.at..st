private operations
scan: item with: word at: column
	| nextItem terminal |
	nextItem := column moveDotForward: item.
	terminal := nextItem end
		addTerminalItem:
			(JETerminalItem 
				given: item symbolAtDot 
				word: word 
				startedAt: item end).
	nextItem addFamilyWith: item and: terminal