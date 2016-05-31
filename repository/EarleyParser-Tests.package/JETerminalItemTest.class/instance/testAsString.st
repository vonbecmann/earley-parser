tests
testAsString
	| terminal |
	terminal := JETerminalItem
		given: (JETerminal character: $H)
		word: $H
		startedAt: (JEChart number: 1)
		andEndedAt: (JEChart number: 12).
	
	self assert: terminal asString equals: '[$H @ [1, 12]]'