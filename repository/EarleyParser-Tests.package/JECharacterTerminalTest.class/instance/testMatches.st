tests
testMatches
	| terminal |
	terminal := JECharacterTerminal character: $x.
	
	self assert: (terminal matches: $x).
	self deny: (terminal matches: $X)