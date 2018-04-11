Class {
	#name : #JEProductionRuleTest,
	#superclass : #TestCase,
	#category : 'EarleyParser-Tests-Public'
}

{ #category : #tests }
JEProductionRuleTest >> testAsString [
	self
		assert: (JEProductionRule head: (JENonterminal named: 'A') body: #()) asString
		equals: 'A: .'
]

{ #category : #tests }
JEProductionRuleTest >> testAsString01 [
	self
		assert:
			(JEProductionRule
				head: (JENonterminal named: 'A')
				body:
					{	(JENonterminal named: 'B'). 
						(JENonterminal named: 'C').
						(JENonterminal named: 'D')	}) asString
		equals: 'A: B, C, D.'
]

{ #category : #tests }
JEProductionRuleTest >> testEqual [
	| one other |
	one := JEProductionRule
				head: (JENonterminal named: 'A') body: {(JENonterminal named: 'A')}.
	other := JEProductionRule
					head: (JENonterminal named: 'A') body: {(JENonterminal named: 'A')}.
					
	self assert: one equals: other.
	self assert: one hash equals: other hash.
	self assert: other equals: one.
	self assert: other hash equals: one hash.
	self deny: one == other
]

{ #category : #tests }
JEProductionRuleTest >> testEqual01 [
	| one other |
	one := JEProductionRule head: (JENonterminal named: 'A') body: #().
	other := JEProductionRule head: (JENonterminal named: 'A') body: #().
	
	self assert: one equals: other.
	self assert: one hash equals: other hash.
	self assert: other equals: one.
	self assert: other hash equals: one hash.
	self deny: one == other
]

{ #category : #tests }
JEProductionRuleTest >> testEqual02 [
	| one other |
	one := JEProductionRule head: (JENonterminal named: 'A') body: {(JENonterminal named: 'B')}.
	other := JEProductionRule head: (JENonterminal named: 'A') body: {(JENonterminal named: 'A')}.
	
	self deny: one = other.
	self deny: one hash = other hash.
	self deny: other = one.
	self deny: other hash = one hash.
	self deny: one == other
]

{ #category : #tests }
JEProductionRuleTest >> testEqual03 [
	| one other |
	one := JEProductionRule head: (JENonterminal named: 'A') body: #().
	other := JEProductionRule head: (JENonterminal named: 'C') body: #().
	
	self deny: one = other.
	self deny: one hash = other hash.
	self deny: other = one.
	self deny: other hash = one hash.
	self deny: one == other
]
