tests
testIsPredicted
	| terminal |
	terminal := JETerminalItem
		given: (JETerminal character: $H)
		word: $H
		startedAt: (JEColumn number: 1)
		andEndedAt: (JEColumn number: 12).

	self deny: terminal isPredicted