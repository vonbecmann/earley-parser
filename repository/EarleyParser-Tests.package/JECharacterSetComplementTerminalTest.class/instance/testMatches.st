tests
testMatches
	| terminal |
	terminal := JECharacterSetComplementTerminal of: Character separators.

	Character separators do: [ :each | self deny: (terminal matches: each) ].
	Character alphabet do: [ :each | self assert: (terminal matches: each) ]