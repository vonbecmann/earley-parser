tests
testMatches
	| terminal |
	terminal := JETerminal charSet: Character separators.

	Character separators do: [ :each | self assert: (terminal matches: each) ].
