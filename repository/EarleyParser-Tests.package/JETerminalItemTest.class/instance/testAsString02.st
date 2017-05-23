tests
testAsString02
	| terminal |
	terminal := JETerminalItem
		given: (JETerminal character: $H)
		word: $H
		startedAt: (JEColumn number: 1).
	
	self assert: terminal asString equals: '[$H @ 1]'