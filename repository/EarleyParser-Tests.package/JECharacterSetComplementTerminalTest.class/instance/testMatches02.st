tests
testMatches02
	| terminal |
	terminal := JECharacterSetComplementTerminal of: Character alphabet.
	
	Character separators do: [ :each | self assert: (terminal matches: each) ].
	Character alphabet do: [ :each | self deny: (terminal matches: each) ].
	($0 to: $9) do: [ :each | self assert: (terminal matches: each) ]