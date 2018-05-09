Class {
	#name : #JECharacterTerminalTest,
	#superclass : #TestCase,
	#category : #'NoamChomsky-Tests'
}

{ #category : #tests }
JECharacterTerminalTest >> testAsString [
	self assert: (JECharacterTerminal character: $+) asString equals: '$+'
]

{ #category : #tests }
JECharacterTerminalTest >> testEqual [
	| one another |
	one := JECharacterTerminal character: $+.
	another := JECharacterTerminal character: $+.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash
]

{ #category : #tests }
JECharacterTerminalTest >> testEqual01 [
	| one another |
	one := JECharacterTerminal character: $+.
	another := JECharacterTerminal character: $*.
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash
]

{ #category : #tests }
JECharacterTerminalTest >> testIsNonterminal [
	self deny: (JECharacterTerminal character: $x) isNonterminal
]

{ #category : #tests }
JECharacterTerminalTest >> testIsTerminal [
	self assert: (JECharacterTerminal character: $x) isTerminal
]

{ #category : #tests }
JECharacterTerminalTest >> testMatches [
	| terminal |
	terminal := JECharacterTerminal character: $x.
	
	self assert: (terminal matches: $x).
	self deny: (terminal matches: $X)
]
