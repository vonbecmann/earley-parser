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
JEColumnTest >> testLikeIfFoundIfNone [
	| one first rule |
	first := JEColumn number: 1.
	rule := JERule
		head: (NCNonterminal named: 'T')
		body:
			{(NCNonterminal named: 'T').
			(NCTerminal character: $+).
			(NCNonterminal named: 'P')}.
	one := (rule dotAt: 2) startedAt: first.
	self 
		assert: (column like: one ifFound: [ :found | found ] ifNone: [ nil ]) 
		equals: nil
]

{ #category : #tests }
JEColumnTest >> testLikeIfFoundIfNone02 [
	| one first rule |
	first := JEColumn number: 1.
	rule := JERule
		head: (NCNonterminal named: 'T')
		body:
			{(NCNonterminal named: 'T').
			(NCTerminal character: $+).
			(NCNonterminal named: 'P')}.
	one := (rule dotAt: 2) startedAt: first.
	column add: one.
	self 
		assert: (column like: one ifFound: [ :found | found ] ifNone: [ nil ]) 
		equals: one.
	self 
		assert: 
		(column like: one ifFound: [ :found | found ] ifNone: [ nil ]) == 
		(column like: one ifFound: [ :found | found ] ifNone: [ nil ])
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
		head: (NCNonterminal named: 'T')
		body:
			{(NCNonterminal named: 'T').
			(NCTerminal character: $+).
			(NCNonterminal named: 'P')}.
	one := (rule dotAt: 2) startedAt: first.
	column add: one.
	self assert: column size equals: 1
]
