tests
testMatches
	| terminal |
	terminal := JECharacterSetTerminal charSet: Character separators.

	Character separators do: [ :each | self assert: (terminal matches: each) ].
