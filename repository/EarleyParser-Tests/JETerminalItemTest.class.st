"
test a terminal item.

"
Class {
	#name : #JETerminalItemTest,
	#superclass : #TestCase,
	#category : #'EarleyParser-Tests-Implementation'
}

{ #category : #tests }
JETerminalItemTest >> testAsString [
	| terminal |
	terminal := JETerminalItem
		given: (NCTerminal character: $H)
		word: $H
		startedAt: (JEColumn number: 1)
		andEndedAt: (JEColumn number: 12).
	
	self assert: terminal asString equals: '[$H @ [1, 12]]'
]

{ #category : #tests }
JETerminalItemTest >> testAsString02 [
	| terminal |
	terminal := JETerminalItem
		given: (NCTerminal character: $H)
		word: $H
		startedAt: (JEColumn number: 1).
	
	self assert: terminal asString equals: '[$H @ 1]'
]

{ #category : #tests }
JETerminalItemTest >> testEqual01 [
	| one another |
	one := JETerminalItem
		given: (NCTerminal character: $H)
		word: $H
		startedAt: (JEColumn number: 1)
		andEndedAt: (JEColumn number: 12).
	another := JETerminalItem
		given: (NCTerminal character: $H)
		word: $H
		startedAt: (JEColumn number: 1)
		andEndedAt: (JEColumn number: 12).
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
JETerminalItemTest >> testEqual02 [
	| one another |
	one := JETerminalItem
		given: (NCTerminal charSet: ($a to: $z))
		word: $z
		startedAt: (JEColumn number: 1)
		andEndedAt: (JEColumn number: 12).
	another := JETerminalItem
		given: (NCTerminal charSet: ($a to: $z))
		word: $b
		startedAt: (JEColumn number: 1)
		andEndedAt: (JEColumn number: 12).
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
JETerminalItemTest >> testEqual03 [
	| one another |
	one := JETerminalItem
		given: (NCTerminal character: $H)
		word: $H
		startedAt: (JEColumn number: 1)
		andEndedAt: (JEColumn number: 12).
	another := JETerminalItem
		given: (NCTerminal character: $H)
		word: $H
		startedAt: (JEColumn number: 1)
		andEndedAt: (JEColumn number: 1).
	self deny: one equals: another.
	self deny: one hash equals: another hash.
	self deny: another equals: one.
	self deny: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
JETerminalItemTest >> testEqual04 [
	| one another |
	one := JETerminalItem
		given: (NCTerminal charSet: ($a to: $z))
		word: $z
		startedAt: (JEColumn number: 3)
		andEndedAt: (JEColumn number: 12).
	another := JETerminalItem
		given: (NCTerminal charSet: ($a to: $z))
		word: $b
		startedAt: (JEColumn number: 1)
		andEndedAt: (JEColumn number: 12).
	self deny: one equals: another.
	self deny: one hash equals: another hash.
	self deny: another equals: one.
	self deny: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
JETerminalItemTest >> testIsActive [
	| terminal |
	terminal := JETerminalItem
		given: (NCTerminal character: $H)
		word: $H
		startedAt: (JEColumn number: 1)
		andEndedAt: (JEColumn number: 12).

	self deny: terminal isActive
]

{ #category : #tests }
JETerminalItemTest >> testIsFinal [
	| terminal |
	terminal := JETerminalItem
		given: (NCTerminal character: $H)
		word: $H
		startedAt: (JEColumn number: 1)
		andEndedAt: (JEColumn number: 12).

	self assert: terminal isFinal 
]

{ #category : #tests }
JETerminalItemTest >> testIsNonterminal [
	| terminal |
	terminal := JETerminalItem
		given: (NCTerminal character: $H)
		word: $H
		startedAt: (JEColumn number: 1)
		andEndedAt: (JEColumn number: 12).

	self deny: terminal isNonterminal 
]

{ #category : #tests }
JETerminalItemTest >> testIsPredicted [
	| terminal |
	terminal := JETerminalItem
		given: (NCTerminal character: $H)
		word: $H
		startedAt: (JEColumn number: 1)
		andEndedAt: (JEColumn number: 12).

	self deny: terminal isPredicted
]

{ #category : #tests }
JETerminalItemTest >> testIsRepresentation [
	| terminal |
	terminal := JETerminalItem
		given: (NCTerminal character: $H)
		word: $H
		startedAt: (JEColumn number: 1)
		andEndedAt: (JEColumn number: 12).

	self deny: terminal isRepresentation 
]

{ #category : #tests }
JETerminalItemTest >> testIsTerminal [
	| terminal |
	terminal := JETerminalItem
		given: (NCTerminal character: $H)
		word: $H
		startedAt: (JEColumn number: 1)
		andEndedAt: (JEColumn number: 12).

	self assert: terminal isTerminal
]
