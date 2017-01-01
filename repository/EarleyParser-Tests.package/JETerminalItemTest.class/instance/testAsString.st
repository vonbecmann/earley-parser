tests
testAsString
	| terminal |
	terminal := JETerminalItem
		given: (JETerminal character: $H)
		word: $H
		startedAt: (JEItemSet number: 1)
		andEndedAt: (JEItemSet number: 12).
	
	self assert: terminal asString equals: '[$H @ [1, 12]]'