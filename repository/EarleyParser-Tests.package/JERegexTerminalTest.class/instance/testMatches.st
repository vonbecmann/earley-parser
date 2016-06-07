tests
testMatches
	| word |
	word := JETerminal regex: '[\w]'.
	($a to: $z) , ($A to: $Z) , ($0 to: $9) , '_'
		do: [ :each | self assert: (word matches: each) ]