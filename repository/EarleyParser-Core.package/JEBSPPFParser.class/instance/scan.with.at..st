private operations
scan: item with: word at: column
	| terminal |
	terminal := column addTerminalItem: (JETerminalItem given: item symbolAtDot word: word startedAt: item end).
	(column moveDotForward: item) addFamilyWith: item and: terminal