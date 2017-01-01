tests
testIsPredicted
	| terminal |
	terminal := JETerminalItem
		given: (JETerminal character: $H)
		word: $H
		startedAt: (JEItemSet number: 1)
		andEndedAt: (JEItemSet number: 12).

	self deny: terminal isPredicted