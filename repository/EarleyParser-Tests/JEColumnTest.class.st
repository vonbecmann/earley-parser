"
column tests.

"
Class {
	#name : #JEColumnTest,
	#superclass : #TestCase,
	#instVars : [
		'column'
	],
	#category : 'EarleyParser-Tests-Implementation'
}

{ #category : #running }
JEColumnTest >> setUp [
	column := JEColumn number: 10
]

{ #category : #tests }
JEColumnTest >> testAsString [
	self assert: column asString equals: 'Column [10]'
]

{ #category : #tests }
JEColumnTest >> testEquality [
	| one another other |
	one := JEColumn number: 1.
	another := JEColumn number: 1.
	other := JEColumn number: 2.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one = other.
	self deny: one hash = other hash.
	self deny: other = one.
	self deny: other hash = one hash
]

{ #category : #tests }
JEColumnTest >> testIsEmpty [
	self assert: column isEmpty
]

{ #category : #tests }
JEColumnTest >> testLike [
	| one first rule |
	first := JEColumn number: 1.
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			(JENonterminal named: 'P')}.
	one := (rule dotAt: 2) startedAt: first.
	self assert: (column like: one) equals: nil
]

{ #category : #tests }
JEColumnTest >> testLike02 [
	| one first rule |
	first := JEColumn number: 1.
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			(JENonterminal named: 'P')}.
	one := (rule dotAt: 2) startedAt: first.
	column add: one.
	self assert: (column like: one) equals: one.
	self assert: (column like: one) == (column like: one)
]

{ #category : #tests }
JEColumnTest >> testSize [
	self assert: column isEmpty.
	self assert: column size equals: 0
]

{ #category : #tests }
JEColumnTest >> testSizeWithOneItem [
	| one first rule |
	self assert: column isEmpty.
	first := JEColumn number: 1.
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			(JENonterminal named: 'P')}.
	one := (rule dotAt: 2) startedAt: first.
	column add: one.
	self assert: column size equals: 1
]