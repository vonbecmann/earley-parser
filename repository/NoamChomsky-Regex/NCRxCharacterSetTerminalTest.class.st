"
tests for RxCharacterSetTerminal

"
Class {
	#name : #NCRxCharacterSetTerminalTest,
	#superclass : #TestCase,
	#category : #'NoamChomsky-Regex-Tests'
}

{ #category : #tests }
NCRxCharacterSetTerminalTest >> testAsString [
	self assert: (NCTerminal rxCharSet: '[\w]') asString equals: '''[\w]''RxCharSet'
]

{ #category : #tests }
NCRxCharacterSetTerminalTest >> testEquality [

	| one another |
	one := NCTerminal rxCharSet: '[\w]'.
	another := NCTerminal rxCharSet: '[\w]'.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
NCRxCharacterSetTerminalTest >> testEquality01 [

	| one another |
	one := NCTerminal rxCharSet: '[\w]'.
	another := NCTerminal rxCharSet: '[\W]'.
	self deny: one equals: another.
	self deny: one hash equals: another hash.
	self deny: another equals: one.
	self deny: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
NCRxCharacterSetTerminalTest >> testMatches [
	| word |
	word := NCTerminal rxCharSet: '[\w]'.
	($a to: $z) , ($A to: $Z) , ($0 to: $9) , '_'
		do: [ :each | self assert: (word matches: each) ]
]
