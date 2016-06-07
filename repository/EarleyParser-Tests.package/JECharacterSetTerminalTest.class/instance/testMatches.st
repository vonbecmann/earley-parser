tests
testMatches
	| terminal |
	terminal := JETerminal charset: Character separators.

	Character separators do: [ :each | self assert: (terminal matches: each) ].
