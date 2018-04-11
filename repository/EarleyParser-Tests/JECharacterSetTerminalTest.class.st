Class {
	#name : #JECharacterSetTerminalTest,
	#superclass : #TestCase,
	#category : 'EarleyParser-Tests-Public'
}

{ #category : #tests }
JECharacterSetTerminalTest >> testAsString [
	self
		assert: (JECharacterSetTerminal charSet: ($a to: $z)) asString
		equals:
			(String
				streamContents: [ :s | 
					s
						print: (String withAll: ($a to: $z));
						nextPutAll: 'CharSet' ])
]

{ #category : #tests }
JECharacterSetTerminalTest >> testEqual [
	| one another |
	one := JECharacterSetTerminal charSet: ($a to: $z).
	another := JECharacterSetTerminal charSet: ($a to: $z).
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another
]

{ #category : #tests }
JECharacterSetTerminalTest >> testEqual01 [
	| one another |
	one := JECharacterSetTerminal charSet: ($a to: $z).
	another := JECharacterSetTerminal charSet: ($A to: $Z).
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another
]

{ #category : #tests }
JECharacterSetTerminalTest >> testIsNonterminal [
	self deny: (JECharacterSetTerminal charSet: ($a to: $z)) isNonterminal
]

{ #category : #tests }
JECharacterSetTerminalTest >> testIsTerminal [
	self assert: (JECharacterSetTerminal charSet: ($a to: $z)) isTerminal
]

{ #category : #tests }
JECharacterSetTerminalTest >> testMatches [
	| terminal |
	terminal := JECharacterSetTerminal charSet: Character separators.

	Character separators do: [ :each | self assert: (terminal matches: each) ].

]
