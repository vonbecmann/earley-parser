Class {
	#name : #NCCharacterSetComplementTerminalTest,
	#superclass : #TestCase,
	#category : #'NoamChomsky-Tests-Base'
}

{ #category : #tests }
NCCharacterSetComplementTerminalTest >> testAsString [
	self
		assert: (NCCharacterSetComplementTerminal of: ($a to: $z)) asString
		equals:
			(String
				streamContents: [ :s | 
					s
						print: (String withAll: ($a to: $z));
						nextPutAll: 'CharSetComplement' ])
]

{ #category : #tests }
NCCharacterSetComplementTerminalTest >> testEquals [

	| one another |
	one := NCCharacterSetComplementTerminal of: ($a to: $z).
	another := NCCharacterSetComplementTerminal of: ($a to: $z).
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
NCCharacterSetComplementTerminalTest >> testEquals01 [

	| one another |
	one := NCCharacterSetComplementTerminal of: ($a to: $z).
	another := NCCharacterSetComplementTerminal of: ($A to: $Z).
	self deny: one equals: another.
	self deny: one hash equals: another hash.
	self deny: another equals: one.
	self deny: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
NCCharacterSetComplementTerminalTest >> testIsNonterminal [
	self deny: (NCCharacterSetComplementTerminal of: ($a to: $z)) isNonterminal
]

{ #category : #tests }
NCCharacterSetComplementTerminalTest >> testIsTerminal [
	self assert: (NCCharacterSetComplementTerminal of: ($a to: $z)) isTerminal
]

{ #category : #tests }
NCCharacterSetComplementTerminalTest >> testMatches [
	| terminal |
	terminal := NCCharacterSetComplementTerminal of: Character separators.

	Character separators do: [ :each | self deny: (terminal matches: each) ].
	Character alphabet do: [ :each | self assert: (terminal matches: each) ]
]

{ #category : #tests }
NCCharacterSetComplementTerminalTest >> testMatches02 [

	| terminal |
	terminal := NCCharacterSetComplementTerminal of: Character alphabet.

	Character separators do: [ :each | self assert: (terminal matches: each) ].
	Character alphabet do: [ :each | self deny: (terminal matches: each) ].
	($0 to: $9) do: [ :each | self assert: (terminal matches: each) ]
]
