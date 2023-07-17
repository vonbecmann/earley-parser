Class {
	#name : #NCProductionRuleTest,
	#superclass : #TestCase,
	#category : #'NoamChomsky-Tests-Base'
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
NCProductionRuleTest >> testAsString02 [
	self
		assert: (NCProductionRule headNamed: 'A' body: #()) asString
		equals: 'A: .'
]

{ #category : #tests }
NCProductionRuleTest >> testAsString03 [
	self
		assert:
			(NCProductionRule
				headNamed: 'A'
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
		       head: (NCNonterminal named: 'A')
		       body: { (NCNonterminal named: 'A') }.
	other := NCProductionRule
		         headNamed: 'A'
		         body: { (NCNonterminal named: 'A') }.

	self assert: one equals: other.
	self assert: one hash equals: other hash.
	self assert: other equals: one.
	self assert: other hash equals: one hash.
	self deny: one identicalTo: other
]

{ #category : #tests }
NCProductionRuleTest >> testEquals01 [

	| one other |
	one := NCProductionRule head: (NCNonterminal named: 'A') body: #(  ).
	other := NCProductionRule
		         head: (NCNonterminal named: 'A')
		         body: #(  ).

	self assert: one equals: other.
	self assert: one hash equals: other hash.
	self assert: other equals: one.
	self assert: other hash equals: one hash.
	self deny: one identicalTo: other
]

{ #category : #tests }
NCProductionRuleTest >> testEquals02 [

	| one other |
	one := NCProductionRule
		       head: (NCNonterminal named: 'A')
		       body: { (NCNonterminal named: 'B') }.
	other := NCProductionRule
		         headNamed: 'A'
		         body: { (NCNonterminal named: 'A') }.
	self deny: one equals: other.
	self deny: one hash equals: other hash.
	self deny: other equals: one.
	self deny: other hash equals: one hash.
	self deny: one identicalTo: other
]

{ #category : #tests }
NCProductionRuleTest >> testEquals03 [

	| one other |
	one := NCProductionRule head: (NCNonterminal named: 'A') body: #(  ).
	other := NCProductionRule headNamed: 'C' body: #(  ).
	self deny: one equals: other.
	self deny: one hash equals: other hash.
	self deny: other equals: one.
	self deny: other hash equals: one hash.
	self deny: one identicalTo: other
]

{ #category : #tests }
NCProductionRuleTest >> testIsEpsilon [
	self assert: (NCProductionRule head: (NCNonterminal named: 'A') body: #()) isEpsilon
]

{ #category : #tests }
NCProductionRuleTest >> testIsRepresentation [
	self
		assert:
			(NCProductionRule
				head: (NCNonterminal named: 'T')
				body: {(NCTerminal character: $t)}) isRepresentation
]
