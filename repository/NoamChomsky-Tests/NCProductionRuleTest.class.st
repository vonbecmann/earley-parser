Class {
	#name : #NCProductionRuleTest,
	#superclass : #TestCase,
	#category : #'NoamChomsky-Tests'
}

{ #category : #tests }
NCProductionRuleTest >> testAsString [
	self
		assert: (NCProductionRule head: (NCNonterminal named: 'A') body: #()) asString
		equals: 'A: .'
]

{ #category : #tests }
NCProductionRuleTest >> testAsString01 [
	self
		assert:
			(NCProductionRule
				head: (NCNonterminal named: 'A')
				body:
					{	(NCNonterminal named: 'B'). 
						(NCNonterminal named: 'C').
						(NCNonterminal named: 'D')	}) asString
		equals: 'A: B, C, D.'
]

{ #category : #tests }
NCProductionRuleTest >> testEquals [
	| one other |
	one := NCProductionRule
				head: (NCNonterminal named: 'A') body: {(NCNonterminal named: 'A')}.
	other := NCProductionRule
					head: (NCNonterminal named: 'A') body: {(NCNonterminal named: 'A')}.
					
	self assert: one equals: other.
	self assert: one hash equals: other hash.
	self assert: other equals: one.
	self assert: other hash equals: one hash.
	self deny: one == other
]

{ #category : #tests }
NCProductionRuleTest >> testEquals01 [
	| one other |
	one := NCProductionRule head: (NCNonterminal named: 'A') body: #().
	other := NCProductionRule head: (NCNonterminal named: 'A') body: #().
	
	self assert: one equals: other.
	self assert: one hash equals: other hash.
	self assert: other equals: one.
	self assert: other hash equals: one hash.
	self deny: one == other
]

{ #category : #tests }
NCProductionRuleTest >> testEquals02 [
	| one other |
	one := NCProductionRule head: (NCNonterminal named: 'A') body: {(NCNonterminal named: 'B')}.
	other := NCProductionRule head: (NCNonterminal named: 'A') body: {(NCNonterminal named: 'A')}.
	
	self deny: one = other.
	self deny: one hash = other hash.
	self deny: other = one.
	self deny: other hash = one hash.
	self deny: one == other
]

{ #category : #tests }
NCProductionRuleTest >> testEquals03 [
	| one other |
	one := NCProductionRule head: (NCNonterminal named: 'A') body: #().
	other := NCProductionRule head: (NCNonterminal named: 'C') body: #().
	
	self deny: one = other.
	self deny: one hash = other hash.
	self deny: other = one.
	self deny: other hash = one hash.
	self deny: one == other
]
