"
rule tests.

"
Class {
	#name : #JERuleTest,
	#superclass : #TestCase,
	#category : 'EarleyParser-Tests-Implementation'
}

{ #category : #tests }
JERuleTest >> testAsString [
	| rule |
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'F').
			(JENonterminal named: 'P').
			(JENonterminal named: 'G')}.
	self assert: rule asString equals: 'T: F, P, G.'
]

{ #category : #tests }
JERuleTest >> testDotAt [
	| rule |
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'F').
			(JETerminal character: $*).
			(JENonterminal named: 'P')}.

	self assert: (rule dotAt: 1) equals: (JEDottedRule given: rule withDotAt: 1).
	self assert: (rule dotAt: 2) equals: (JEDottedRule given: rule withDotAt: 2).
	self assert: (rule dotAt: 3) equals: (JEDottedRule given: rule withDotAt: 3).
	self assert: (rule dotAt: 4) equals: (JEDottedRule given: rule withDotAt: 4)
]

{ #category : #tests }
JERuleTest >> testDotAtBeginning [
	| rule |
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'F').
			(JETerminal character: $*).
			(JENonterminal named: 'P')}.
	self assert: rule dotAtBeginning equals: (JEDottedRule given: rule withDotAt: 1)

]

{ #category : #tests }
JERuleTest >> testDotAtEnd [
	| rule |
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'F').
			(JETerminal character: $*).
			(JENonterminal named: 'P')}.
	self assert: rule dotAtEnd equals: (JEDottedRule given: rule withDotAt: 4)
	

]

{ #category : #tests }
JERuleTest >> testEquality [
	| one another |
	one := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			(JENonterminal named: 'P')}.
	another := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			(JENonterminal named: 'P')}.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another
]

{ #category : #tests }
JERuleTest >> testEquality02 [
	| one another |
	one := JERule head: (JENonterminal named: 'T') body: #().
	another := JERule head: (JENonterminal named: 'T') body: #().
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another
]

{ #category : #tests }
JERuleTest >> testEquality03 [
	| one another |
	one := another := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			(JENonterminal named: 'P')}.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self assert: one == another
]

{ #category : #tests }
JERuleTest >> testEquals [
	| one another |
	one := JERule
		head: (JENonterminal named: 'T')
		body: 	{(JETerminal character: $-). (JENonterminal named: 'P')}.
	another := JEProductionRule
		head: (JENonterminal named: 'T')
		body: 	{(JETerminal character: $-). (JENonterminal named: 'P')}.
	self assert: (one equals: another)
]

{ #category : #tests }
JERuleTest >> testIsEpsilon [
	| rule |
	rule := JERule head: (JENonterminal named: 'T') body: {}.
	self assert: rule isEpsilon
]

{ #category : #tests }
JERuleTest >> testIsRepresentation [
	| rule |
	rule := JERule head: (JENonterminal named: 'T') body: {(JETerminal character: $t)}.
	self assert: rule isRepresentation
]

{ #category : #tests }
JERuleTest >> testIsRepresentation01 [
	| rule |
	rule := JERule head: (JENonterminal named: 'T') body: {(JENonterminal named: 'P')}.
	self deny: rule isRepresentation
]
