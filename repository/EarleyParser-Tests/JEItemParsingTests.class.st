"
test item's parsing.

"
Class {
	#name : #JEItemParsingTests,
	#superclass : #TestCase,
	#category : 'EarleyParser-Tests-Parsing'
}

{ #category : #tests }
JEItemParsingTests >> testAddEmptyFamily [
	| item first |
	first := JEColumn number: 1.
	item := (JERule head: (JENonterminal named: 'F') body: {}) dotAtEnd startedAt: first.
	item addFamily: JEFamily empty.
	self assert: item familiesSize equals: 1
]

{ #category : #tests }
JEItemParsingTests >> testAddEmptyFamily01 [
	| item first |
	first := JEColumn number: 1.
	item := (JERule head: (JENonterminal named: 'F') body: {}) dotAtEnd startedAt: first.
	item addFamily: JEFamily empty.
	item addFamily: JEFamily empty.
	item addFamily: JEFamily empty.
	self assert: item familiesSize equals: 1
]

{ #category : #tests }
JEItemParsingTests >> testAddEmptyFamily02 [
	| item first |
	first := JEColumn number: 1.
	item := (JERule head: (JENonterminal named: 'F') body: {}) dotAtEnd startedAt: first.
	self assert: item familiesSize equals: 1
]

{ #category : #tests }
JEItemParsingTests >> testAddFamily [
	| first middle last rule target previous complete family |
	first := JEColumn number: 1.
	middle := JEColumn number: 3.
	last := JEColumn number: 4.
	rule := JERule
		head: (JENonterminal named: 'F')
		body: {(JENonterminal named: 'G'). (JENonterminal named: 'H')}.
		
	previous := (rule dotAt: 2) startedAt: first andEndedAt: middle.
	complete := (JERule head: (JENonterminal named: 'H') body: {(JENonterminal named: 'I')}) dotAtEnd startedAt: middle andEndedAt: last.
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
		head: (JENonterminal named: 'F')
		body: {(JENonterminal named: 'G'). (JENonterminal named: 'H')}.
		
	previous := (rule dotAt: 2) startedAt: first andEndedAt: middle.
	complete := (JERule head: (JENonterminal named: 'H') body: {(JENonterminal named: 'I')}) dotAtEnd startedAt: middle andEndedAt: last.
	target := rule dotAtEnd startedAt: first andEndedAt: last.
	
	family := previous newFamilyWith: complete.

	target addFamily: family.
	target addFamilyWith: previous and: complete.
	target addFamilyWith: previous and: complete.
		
	self assert: target familiesSize equals: 1.
	self assert: (target families includes: family)
]

{ #category : #tests }
JEItemParsingTests >> testAddFamily02 [
	| first middle last rule target previous scanned family |
	first := JEColumn number: 1.
	middle := JEColumn number: 3.
	last := JEColumn number: 4.
	rule := JERule
		head: (JENonterminal named: 'F')
		body: 	{(JENonterminal named: 'G'). (JETerminal character: $H)}.
			
	previous := (rule dotAt: 2) startedAt: first andEndedAt: middle.
	scanned := JETerminalItem given: (JETerminal character: $H) word: $H startedAt: middle andEndedAt: last.
	target := rule dotAtEnd startedAt: first andEndedAt: last.
	
	family := previous newFamilyWith: scanned.
	
	target addFamilyWith: previous and: scanned.
	
	self assert: target familiesSize equals: 1.
	self assert: (target families anySatisfy: [ :each | each first = family first and: [ each second = family second ] ])
]

{ #category : #tests }
JEItemParsingTests >> testAddFamily03 [
	| first middle last rule target previous scanned family |
	first := JEColumn number: 1.
	middle := JEColumn number: 3.
	last := JEColumn number: 4.
	rule := JERule
		head: (JENonterminal named: 'F')
		body: {(JENonterminal named: 'G'). (JETerminal character: $H)}.
		
	previous := (rule dotAt: 2) startedAt: first andEndedAt: middle.
	scanned := JETerminalItem given: (JETerminal character: $H) word: $H startedAt: middle andEndedAt: last.
		
	target := rule dotAtEnd startedAt: first andEndedAt: last.
	
	family := previous newFamilyWith: scanned.

	target addFamily: family.
	target addFamilyWith: previous and: scanned.
	target addFamilyWith: previous and: scanned.

		
	self assert: target familiesSize equals: 1.
	self assert: (target families includes: family)
]
