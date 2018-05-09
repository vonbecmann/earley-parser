"
tests for RxCharacterSetTerminal

"
Class {
	#name : #JERxCharacterSetTerminalTest,
	#superclass : #TestCase,
	#category : #'NoamChomsky-Regex-Tests'
}

{ #category : #tests }
JERxCharacterSetTerminalTest >> testAsString [
	self assert: (JETerminal rxCharSet: '[\w]') asString equals: '''[\w]''RxCharSet'
]

{ #category : #tests }
JERxCharacterSetTerminalTest >> testEquality [
	| one another |
	one := JETerminal rxCharSet: '[\w]'.
	another := JETerminal rxCharSet: '[\w]'.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another
]

{ #category : #tests }
JERxCharacterSetTerminalTest >> testEquality01 [
	| one another |
	one := JETerminal rxCharSet: '[\w]'.
	another := JETerminal rxCharSet: '[\W]'.
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another
]

{ #category : #tests }
JERxCharacterSetTerminalTest >> testMatches [
	| word |
	word := JETerminal rxCharSet: '[\w]'.
	($a to: $z) , ($A to: $Z) , ($0 to: $9) , '_'
		do: [ :each | self assert: (word matches: each) ]
]
