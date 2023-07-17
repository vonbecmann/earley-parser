Class {
	#name : #NCCharacterTerminalTest,
	#superclass : #TestCase,
	#category : #'NoamChomsky-Tests-Base'
}

{ #category : #tests }
NCCharacterTerminalTest >> testAsString [
	self assert: (NCCharacterTerminal character: $+) asString equals: '$+'
]

{ #category : #tests }
NCCharacterTerminalTest >> testEquals [
	| one another |
	one := NCCharacterTerminal character: $+.
	another := NCCharacterTerminal character: $+.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash
]

{ #category : #tests }
NCCharacterTerminalTest >> testEquals01 [

	| one another |
	one := NCCharacterTerminal character: $+.
	another := NCCharacterTerminal character: $*.
	self deny: one equals: another.
	self deny: one hash equals: another hash.
	self deny: another equals: one.
	self deny: another hash equals: one hash
]

{ #category : #tests }
NCCharacterTerminalTest >> testIsNonterminal [
	self deny: (NCCharacterTerminal character: $x) isNonterminal
]

{ #category : #tests }
NCCharacterTerminalTest >> testIsTerminal [
	self assert: (NCCharacterTerminal character: $x) isTerminal
]

{ #category : #tests }
NCCharacterTerminalTest >> testMatches [
	| terminal |
	terminal := NCCharacterTerminal character: $x.
	
	self assert: (terminal matches: $x).
	self deny: (terminal matches: $X)
]
