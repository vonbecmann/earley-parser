Class {
	#name : #NCCharacterSetTerminalTest,
	#superclass : #TestCase,
	#category : #'NoamChomsky-Tests-Base'
}

{ #category : #tests }
NCCharacterSetTerminalTest >> testAsString [
	self
		assert: (NCCharacterSetTerminal charSet: ($a to: $z)) asString
		equals:
			(String
				streamContents: [ :s | 
					s
						print: (String withAll: ($a to: $z));
						nextPutAll: 'CharSet' ])
]

{ #category : #tests }
NCCharacterSetTerminalTest >> testEquals [

	| one another |
	one := NCCharacterSetTerminal charSet: ($a to: $z).
	another := NCCharacterSetTerminal charSet: ($a to: $z).
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
NCCharacterSetTerminalTest >> testEquals01 [

	| one another |
	one := NCCharacterSetTerminal charSet: ($a to: $z).
	another := NCCharacterSetTerminal charSet: ($A to: $Z).
	self deny: one equals: another.
	self deny: one hash equals: another hash.
	self deny: another equals: one.
	self deny: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
NCCharacterSetTerminalTest >> testIsNonterminal [
	self deny: (NCCharacterSetTerminal charSet: ($a to: $z)) isNonterminal
]

{ #category : #tests }
NCCharacterSetTerminalTest >> testIsTerminal [
	self assert: (NCCharacterSetTerminal charSet: ($a to: $z)) isTerminal
]

{ #category : #tests }
NCCharacterSetTerminalTest >> testMatches [
	| terminal |
	terminal := NCCharacterSetTerminal charSet: Character separators.

	Character separators do: [ :each | self assert: (terminal matches: each) ].

]
