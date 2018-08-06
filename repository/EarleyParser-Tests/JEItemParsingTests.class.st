"
test item's parsing.

"
Class {
	#name : #JEItemParsingTests,
	#superclass : #TestCase,
	#category : #'EarleyParser-Tests-Implementation'
}

{ #category : #tests }
JEItemParsingTests >> testAddFamily [
	| first middle last rule target previous complete family |
	first := JEColumn number: 1.
	middle := JEColumn number: 3.
	last := JEColumn number: 4.
	rule := JERule
		head: (NCNonterminal named: 'F')
		body: {(NCNonterminal named: 'G'). (NCNonterminal named: 'H')}.
		
	previous := (rule dotAt: 2) startedAt: first andEndedAt: middle.
	complete := (JERule head: (NCNonterminal named: 'H') body: {(NCNonterminal named: 'I')}) dotAtEnd startedAt: middle andEndedAt: last.
	target := rule dotAtEnd startedAt: first andEndedAt: last.
	
	family := previous newFamilyWith: complete.

	target addFamily: family.

	self assert: target familiesSize equals: 1.
	self assert: (target families includes: family)
]

{ #category : #tests }
JEItemParsingTests >> testAddFamily01 [
	| first middle last rule target previous complete family |
	first := JEColumn number: 1.
	middle := JEColumn number: 3.
	last := JEColumn number: 4.
	rule := JERule
		head: (NCNonterminal named: 'F')
		body: {(NCNonterminal named: 'G'). (NCNonterminal named: 'H')}.
		
	previous := (rule dotAt: 2) startedAt: first andEndedAt: middle.
	complete := (JERule head: (NCNonterminal named: 'H') body: {(NCNonterminal named: 'I')}) dotAtEnd startedAt: middle andEndedAt: last.
	target := rule dotAtEnd startedAt: first andEndedAt: last.
	
	family := previous newFamilyWith: complete.

	target addFamily: family.
	target addFamilyWith: previous and: complete.
	target addFamilyWith: previous and: complete.
		
	self assert: target familiesSize equals: 1.
	self assert: (target families includes: family)
]
