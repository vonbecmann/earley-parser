"
rule tests.

"
Class {
	#name : #JERuleTest,
	#superclass : #TestCase,
	#category : #'EarleyParser-Tests-Implementation'
}

{ #category : #tests }
JERuleTest >> testAsJERule [
	| productionRule rule |
	productionRule := NCProductionRule
		headNamed: 'A'
		body:
			{(NCNonterminal named: 'B').
			(NCNonterminal named: 'C').
			(NCNonterminal named: 'D')}.
	rule := productionRule asJERule.
	self assert: productionRule head identicalTo: rule head.
	self assert: productionRule body size equals: rule body size.
	self assert: productionRule body first identicalTo: rule body first.
	self assert: productionRule body first equals: rule body first.
	self assert: productionRule body second identicalTo: rule body second.
	self assert: productionRule body second equals: rule body second.
	self assert: productionRule body third identicalTo: rule body third.
	self assert: productionRule body third equals: rule body third
]

{ #category : #tests }
JERuleTest >> testAsString [
	| rule |
	rule := JERule
		head: (NCNonterminal named: 'T')
		body:
			{(NCNonterminal named: 'F').
			(NCNonterminal named: 'P').
			(NCNonterminal named: 'G')}.
	self assert: rule asString equals: 'T: F, P, G.'
]

{ #category : #tests }
JERuleTest >> testDotAt [
	| rule |
	rule := JERule
		head: (NCNonterminal named: 'T')
		body:
			{(NCNonterminal named: 'F').
			(NCTerminal character: $*).
			(NCNonterminal named: 'P')}.

	self assert: (rule dotAt: 1) equals: (JEDottedRule given: rule withDotAt: 1).
	self assert: (rule dotAt: 2) equals: (JEDottedRule given: rule withDotAt: 2).
	self assert: (rule dotAt: 3) equals: (JEDottedRule given: rule withDotAt: 3).
	self assert: (rule dotAt: 4) equals: (JEDottedRule given: rule withDotAt: 4)
]

{ #category : #tests }
JERuleTest >> testDotAtBeginning [
	| rule |
	rule := JERule
		head: (NCNonterminal named: 'T')
		body:
			{(NCNonterminal named: 'F').
			(NCTerminal character: $*).
			(NCNonterminal named: 'P')}.
	self assert: rule dotAtBeginning equals: (JEDottedRule given: rule withDotAt: 1)
]

{ #category : #tests }
JERuleTest >> testDotAtEnd [
	| rule |
	rule := JERule
		head: (NCNonterminal named: 'T')
		body:
			{(NCNonterminal named: 'F').
			(NCTerminal character: $*).
			(NCNonterminal named: 'P')}.
	self assert: rule dotAtEnd equals: (JEDottedRule given: rule withDotAt: 4)
]

{ #category : #tests }
JERuleTest >> testEquality [
	| one another |
	one := JERule
		head: (NCNonterminal named: 'T')
		body:
			{(NCNonterminal named: 'T').
			(NCTerminal character: $+).
			(NCNonterminal named: 'P')}.
	another := JERule
		head: (NCNonterminal named: 'T')
		body:
			{(NCNonterminal named: 'T').
			(NCTerminal character: $+).
			(NCNonterminal named: 'P')}.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
JERuleTest >> testEquality02 [
	| one another |
	one := JERule head: (NCNonterminal named: 'T') body: #().
	another := JERule head: (NCNonterminal named: 'T') body: #().
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
JERuleTest >> testEquality03 [
	| one another |
	one := another := JERule
		head: (NCNonterminal named: 'T')
		body:
			{(NCNonterminal named: 'T').
			(NCTerminal character: $+).
			(NCNonterminal named: 'P')}.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self assert: one identicalTo: another
]

{ #category : #tests }
JERuleTest >> testIsEpsilon [
	| rule |
	rule := JERule head: (NCNonterminal named: 'T') body: {}.
	self assert: rule isEpsilon
]

{ #category : #tests }
JERuleTest >> testIsRepresentation [
	| rule |
	rule := JERule head: (NCNonterminal named: 'T') body: {(NCTerminal character: $t)}.
	self assert: rule isRepresentation
]

{ #category : #tests }
JERuleTest >> testIsRepresentation01 [
	| rule |
	rule := JERule head: (NCNonterminal named: 'T') body: {(NCNonterminal named: 'P')}.
	self deny: rule isRepresentation
]
