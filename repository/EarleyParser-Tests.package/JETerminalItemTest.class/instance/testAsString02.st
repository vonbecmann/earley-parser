tests
testAsString02
	| terminal |
	terminal := JETerminalItem
		given: (JETerminal character: $H)
		word: $H
		startedAt: (JEChart number: 1).
	
	self assert: terminal asString equals: '[$H @ 1]'