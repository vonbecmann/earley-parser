Class {
	#name : #JEItemEqualityTest,
	#superclass : #TestCase,
	#category : #'EarleyParser-Tests-Implementation'
}

{ #category : #tests }
JEItemEqualityTest >> testItemEquality [
	| one another first rule |
	first := JEColumn number: 1.
	rule := JERule
		head: (NCNonterminal named: 'T')
		body:
			{(NCNonterminal named: 'T').
			(NCTerminal character: $+).
			(NCNonterminal named: 'P')}.
	one := (rule dotAt: 2) startedAt: first.
	another := (rule dotAt: 2) startedAt: first.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one identicalTo: another
]

{ #category : #tests }
JEItemEqualityTest >> testItemEquality02 [
	| one another first rule |
	first := JEColumn number: 1.
	rule := JERule
		head: (NCNonterminal named: 'T')
		body:
			{(NCNonterminal named: 'T').
			(NCTerminal character: $+).
			(NCNonterminal named: 'P')}.
	one := (rule dotAt: 2)
		startedAt: first
		andEndedAt: (JEColumn number: 3).
	another := (rule dotAt: 2)
		startedAt: first
		andEndedAt: (JEColumn number: 4).
	self deny: one equals: another.
	self deny: one hash equals: another hash.
	self deny: another equals: one.
	self deny: another hash equals: one hash
]

{ #category : #tests }
JEItemEqualityTest >> testItemEquality03 [
	| one another first rule |
	first := JEColumn number: 1.
	rule := JERule
		head: (NCNonterminal named: 'T')
		body:
			{(NCNonterminal named: 'T').
			(NCTerminal character: $+).
			(NCNonterminal named: 'P')}.
	one := (rule dotAt: 2) startedAt: first.
	another := (rule dotAt: 2)
		startedAt: first
		andEndedAt: (JEColumn number: 4).
	self deny: one equals: another.
	self deny: one hash equals: another hash.
	self deny: another equals: one.
	self deny: another hash equals: one hash
]

{ #category : #tests }
JEItemEqualityTest >> testItemEquality04 [
	| one another first rule |
	first := JEColumn number: 1.
	rule := JERule
		head: (NCNonterminal named: 'T')
		body:
			{(NCNonterminal named: 'T').
			(NCTerminal character: $+).
			(NCNonterminal named: 'P')}.
	one := (rule dotAt: 2)
		startedAt: first
		andEndedAt: (JEColumn number: 3).
	another := (rule dotAt: 2) startedAt: first.
	self deny: one equals: another.
	self deny: one hash equals: another hash.
	self deny: another equals: one.
	self deny: another hash equals: one hash
]

{ #category : #tests }
JEItemEqualityTest >> testItemEquality05 [
	| one another first rule |
	first := JEColumn number: 1.
	rule := JERule
		head: (NCNonterminal named: 'T')
		body:
			{(NCNonterminal named: 'T').
			(NCTerminal character: $+).
			(NCNonterminal named: 'P')}.
	one := another := (rule dotAt: 2) startedAt: first.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self assert: one identicalTo: another
]
