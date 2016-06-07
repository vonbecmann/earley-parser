tests
testMatches
	| terminal |
	terminal := JETerminal character: $x.
	
	self assert: (terminal matches: $x).
	self deny: (terminal matches: $X)