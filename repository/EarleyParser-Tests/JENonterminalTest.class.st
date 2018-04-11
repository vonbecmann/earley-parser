"
nonterminal tests.

"
Class {
	#name : #JENonterminalTest,
	#superclass : #TestCase,
	#category : 'EarleyParser-Tests-Implementation'
}

{ #category : #tests }
JENonterminalTest >> testEquality [
	| one another |
	one := JENonterminal named: 'E'.
	another := JENonterminal named: 'E'.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: (JENonterminal named: 'E') = (JETerminal character: $E).
	self deny: (JENonterminal named: 'E') hash = (JETerminal character: $E) hash
]

{ #category : #tests }
JENonterminalTest >> testIsNonterminal [
	self assert: (JENonterminal named: 'E') isNonterminal
]

{ #category : #tests }
JENonterminalTest >> testIsTerminal [
	self deny: (JENonterminal named: 'E') isTerminal
]
