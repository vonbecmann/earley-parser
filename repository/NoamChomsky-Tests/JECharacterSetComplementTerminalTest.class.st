Class {
	#name : #JECharacterSetComplementTerminalTest,
	#superclass : #TestCase,
	#category : #'NoamChomsky-Tests'
}

{ #category : #tests }
JECharacterSetComplementTerminalTest >> testAsString [
	self
		assert: (JECharacterSetComplementTerminal of: ($a to: $z)) asString
		equals:
			(String
				streamContents: [ :s | 
					s
						print: (String withAll: ($a to: $z));
						nextPutAll: 'CharSetComplement' ])
]

{ #category : #tests }
JECharacterSetComplementTerminalTest >> testEqual [
	| one another |
	one := JECharacterSetComplementTerminal of: ($a to: $z).
	another := JECharacterSetComplementTerminal of: ($a to: $z).
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another
]

{ #category : #tests }
JECharacterSetComplementTerminalTest >> testEqual01 [
	| one another |
	one := JECharacterSetComplementTerminal of: ($a to: $z).
	another := JECharacterSetComplementTerminal of: ($A to: $Z).
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another
]

{ #category : #tests }
JECharacterSetComplementTerminalTest >> testIsNonterminal [
	self deny: (JECharacterSetComplementTerminal of: ($a to: $z)) isNonterminal
]

{ #category : #tests }
JECharacterSetComplementTerminalTest >> testIsTerminal [
	self assert: (JECharacterSetComplementTerminal of: ($a to: $z)) isTerminal
]

{ #category : #tests }
JECharacterSetComplementTerminalTest >> testMatches [
	| terminal |
	terminal := JECharacterSetComplementTerminal of: Character separators.

	Character separators do: [ :each | self deny: (terminal matches: each) ].
	Character alphabet do: [ :each | self assert: (terminal matches: each) ]
]

{ #category : #tests }
JECharacterSetComplementTerminalTest >> testMatches02 [
	| terminal |
	terminal := JECharacterSetComplementTerminal of: Character alphabet.
	
	Character separators do: [ :each | self assert: (terminal matches: each) ].
	Character alphabet do: [ :each | self deny: (terminal matches: each) ].
	($0 to: $9) do: [ :each | self assert: (terminal matches: each) ]
]
