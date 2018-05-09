Class {
	#name : #NCProductionRuleTest,
	#superclass : #TestCase,
	#category : #'NoamChomsky-Tests'
}

{ #category : #tests }
NCProductionRuleTest >> testAsString [
	self
		assert: (NCProductionRule head: (JENonterminal named: 'A') body: #()) asString
		equals: 'A: .'
]

{ #category : #tests }
NCProductionRuleTest >> testAsString01 [
	self
		assert:
			(NCProductionRule
				head: (JENonterminal named: 'A')
				body:
					{	(JENonterminal named: 'B'). 
						(JENonterminal named: 'C').
						(JENonterminal named: 'D')	}) asString
		equals: 'A: B, C, D.'
]

{ #category : #tests }
NCProductionRuleTest >> testEqual [
	| one other |
	one := NCProductionRule
				head: (JENonterminal named: 'A') body: {(JENonterminal named: 'A')}.
	other := NCProductionRule
					head: (JENonterminal named: 'A') body: {(JENonterminal named: 'A')}.
					
	self assert: one equals: other.
	self assert: one hash equals: other hash.
	self assert: other equals: one.
	self assert: other hash equals: one hash.
	self deny: one == other
]

{ #category : #tests }
NCProductionRuleTest >> testEqual01 [
	| one other |
	one := NCProductionRule head: (JENonterminal named: 'A') body: #().
	other := NCProductionRule head: (JENonterminal named: 'A') body: #().
	
	self assert: one equals: other.
	self assert: one hash equals: other hash.
	self assert: other equals: one.
	self assert: other hash equals: one hash.
	self deny: one == other
]

{ #category : #tests }
NCProductionRuleTest >> testEqual02 [
	| one other |
	one := NCProductionRule head: (JENonterminal named: 'A') body: {(JENonterminal named: 'B')}.
	other := NCProductionRule head: (JENonterminal named: 'A') body: {(JENonterminal named: 'A')}.
	
	self deny: one = other.
	self deny: one hash = other hash.
	self deny: other = one.
	self deny: other hash = one hash.
	self deny: one == other
]

{ #category : #tests }
NCProductionRuleTest >> testEqual03 [
	| one other |
	one := NCProductionRule head: (JENonterminal named: 'A') body: #().
	other := NCProductionRule head: (JENonterminal named: 'C') body: #().
	
	self deny: one = other.
	self deny: one hash = other hash.
	self deny: other = one.
	self deny: other hash = one hash.
	self deny: one == other
]
