"
dotted rule tests.

"
Class {
	#name : #JEDottedRuleTest,
	#superclass : #TestCase,
	#category : 'EarleyParser-Tests-Implementation'
}

{ #category : #tests }
JEDottedRuleTest >> testAsString [
	| rule |
	rule := JERule head: (JENonterminal named: 'T') body: #().
	self assert: rule dotAtEnd asString equals: 'T: ·.'
]

{ #category : #tests }
JEDottedRuleTest >> testAsString01 [
	| rule |
	rule := JERule
		head: (JENonterminal named: 'T')
		body: 	{(JENonterminal named: 'F'). (JENonterminal named: 'P'). (JENonterminal named: 'G')}.
			
	self assert: (rule dotAt: 1) asString equals: 'T: ·F, P, G.'.
	self assert: rule dotAtBeginning asString equals: 'T: ·F, P, G.'
]

{ #category : #tests }
JEDottedRuleTest >> testAsString02 [
	| rule |
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'F').
			(JENonterminal named: 'P').
			(JENonterminal named: 'G')}.
	self assert: (rule dotAt: 2) asString equals: 'T: F, ·P, G.'
]

{ #category : #tests }
JEDottedRuleTest >> testAsString03 [
	| rule |
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'F').
			(JENonterminal named: 'P').
			(JENonterminal named: 'G')}.
	self assert: (rule dotAt: 3) asString equals: 'T: F, P, ·G.'
]

{ #category : #tests }
JEDottedRuleTest >> testAsString04 [
	| rule |
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'F').
			(JENonterminal named: 'P').
			(JENonterminal named: 'G')}.
	self assert: (rule dotAt: 4) asString equals: 'T: F, P, G·.'.
	self assert: rule dotAtEnd asString equals: 'T: F, P, G·.'
]

{ #category : #tests }
JEDottedRuleTest >> testEquality [
	| one another rule |
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			(JENonterminal named: 'P')}.
	one := JEDottedRule given: rule withDotAt: 2.
	another := JEDottedRule given: rule withDotAt: 2.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another
]

{ #category : #tests }
JEDottedRuleTest >> testEquality02 [
	| one another rule anotherRule |
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			(JENonterminal named: 'P')}.
	anotherRule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			(JENonterminal named: 'P')}.
	one := JEDottedRule given: rule withDotAt: 2.
	another := JEDottedRule given: anotherRule withDotAt: 2.
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another
]

{ #category : #tests }
JEDottedRuleTest >> testEquality03 [
	| one another rule |
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			(JENonterminal named: 'P')}.
	one := rule dotAt: 2.
	another := rule dotAt: 2.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self assert: one == another
]

{ #category : #tests }
JEDottedRuleTest >> testEquality04 [
	| one another rule anotherRule |
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'F').
			(JETerminal character: $.)}.
	anotherRule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'F').
			(JETerminal character: $.)}.
	one := rule dotAt: 2.
	another := anotherRule dotAt: 2.
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another
]

{ #category : #tests }
JEDottedRuleTest >> testEquality05 [
	| one another rule |
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			(JENonterminal named: 'P')}.
	one := (rule dotAt: 1) moveDotForward.
	another := rule dotAt: 2.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self assert: one == another
]

{ #category : #tests }
JEDottedRuleTest >> testEquality06 [
	| one another rule |
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			(JENonterminal named: 'P')}.
	one := another := JEDottedRule given: rule withDotAt: 2.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self assert: one == another
]

{ #category : #tests }
JEDottedRuleTest >> testIsActive [
	| rule |
	rule := JERule
		head: (JENonterminal named: 'T')
		body: {(JENonterminal named: 'F'). (JENonterminal named: 'P'). (JENonterminal named: 'G')}.

	self deny: rule dotAtBeginning isActive.
	self assert: (rule dotAt: 2) isActive.
	self assert: (rule dotAt: 3) isActive.
	self deny: rule dotAtEnd isActive
]

{ #category : #tests }
JEDottedRuleTest >> testIsEpsilon [
	| rule |
	rule := JERule head: (JENonterminal named: 'T') body: {}.

	self assert: rule dotAtBeginning isEpsilon.
	self assert: rule dotAtEnd isEpsilon
]

{ #category : #tests }
JEDottedRuleTest >> testIsFinal [
	| rule |
	rule := JERule
		head: (JENonterminal named: 'T')
		body: {(JENonterminal named: 'F'). (JENonterminal named: 'P'). (JENonterminal named: 'G')}.

	self deny: rule dotAtBeginning isFinal.
	self deny: (rule dotAt: 2) isFinal.
	self deny: (rule dotAt: 3) isFinal.
	self assert: rule dotAtEnd isFinal
]

{ #category : #tests }
JEDottedRuleTest >> testIsPredicted [
	| rule |
	rule := JERule
		head: (JENonterminal named: 'T')
		body: {(JENonterminal named: 'F'). (JENonterminal named: 'P'). (JENonterminal named: 'G')}.

	self assert: rule dotAtBeginning isPredicted.
	self deny: (rule dotAt: 2) isPredicted.
	self deny: (rule dotAt: 3) isPredicted.
	self deny: rule dotAtEnd isPredicted
]
