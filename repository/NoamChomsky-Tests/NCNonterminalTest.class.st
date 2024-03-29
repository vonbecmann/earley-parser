"
nonterminal tests.

"
Class {
	#name : #NCNonterminalTest,
	#superclass : #TestCase,
	#category : #'NoamChomsky-Tests-Base'
}

{ #category : #tests }
NCNonterminalTest >> testAsString [
	self 
		assert: (NCNonterminal named: 'START') asString 
		equals: 'START'
]

{ #category : #tests }
NCNonterminalTest >> testEquals [

	| one another |
	one := NCNonterminal named: 'E'.
	another := NCNonterminal named: 'E'.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self
		deny: (NCNonterminal named: 'E')
		equals: (NCTerminal character: $E).
	self
		deny: (NCNonterminal named: 'E') hash
		equals: (NCTerminal character: $E) hash
]

{ #category : #tests }
NCNonterminalTest >> testEquals01 [

	| one another |
	one := NCNonterminal named: 'E'.
	another := one.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self
		deny: (NCNonterminal named: 'E')
		equals: (NCTerminal character: $E).
	self
		deny: (NCNonterminal named: 'E') hash
		equals: (NCTerminal character: $E) hash
]

{ #category : #tests }
NCNonterminalTest >> testIsNonterminal [
	self assert: (NCNonterminal named: 'E') isNonterminal
]

{ #category : #tests }
NCNonterminalTest >> testIsTerminal [
	self deny: (NCNonterminal named: 'E') isTerminal
]
