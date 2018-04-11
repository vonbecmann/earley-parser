Class {
	#name : #JEItemEqualityTests,
	#superclass : #TestCase,
	#category : 'EarleyParser-Tests-Implementation'
}

{ #category : #tests }
JEItemEqualityTests >> testItemEquality [
	| one another first rule |
	first := JEColumn number: 1.
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			(JENonterminal named: 'P')}.
	one := (rule dotAt: 2) startedAt: first.
	another := (rule dotAt: 2) startedAt: first.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another
]

{ #category : #tests }
JEItemEqualityTests >> testItemEquality02 [
	| one another first rule |
	first := JEColumn number: 1.
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			(JENonterminal named: 'P')}.
	one := (rule dotAt: 2) startedAt: first andEndedAt: (JEColumn number: 3).
	another := (rule dotAt: 2) startedAt: first andEndedAt: (JEColumn number: 4).
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash
]

{ #category : #tests }
JEItemEqualityTests >> testItemEquality03 [
	| one another first rule |
	first := JEColumn number: 1.
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			(JENonterminal named: 'P')}.
	one := (rule dotAt: 2) startedAt: first.
	another := (rule dotAt: 2) startedAt: first andEndedAt: (JEColumn number: 4).
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash
]

{ #category : #tests }
JEItemEqualityTests >> testItemEquality04 [
	| one another first rule |
	first := JEColumn number: 1.
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			(JENonterminal named: 'P')}.
	one := (rule dotAt: 2) startedAt: first andEndedAt: (JEColumn number: 3).
	another := (rule dotAt: 2) startedAt: first.
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash
]

{ #category : #tests }
JEItemEqualityTests >> testItemEquality05 [
	| one another first rule |
	first := JEColumn number: 1.
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'T').
			(JETerminal character: $+).
			(JENonterminal named: 'P')}.
	one := another := (rule dotAt: 2) startedAt: first.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self assert: one == another
]
