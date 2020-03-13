"
dotted item's tests 

first - a chart.
rule - an earley rule.

"
Class {
	#name : #JEDottedItemTest,
	#superclass : #TestCase,
	#instVars : [
		'first',
		'rule',
		'item'
	],
	#category : 'EarleyParser-Tests-Implementation'
}

{ #category : #running }
JEDottedItemTest >> setUp [
	first := JEColumn number: 1.
	rule := JERule
		head: (NCNonterminal named: 'T')
		body: 	{(NCNonterminal named: 'T'). (NCTerminal character: $+). (NCNonterminal named: 'P')}.
	item := nil
]

{ #category : #tests }
JEDottedItemTest >> testAddFamilyWithTo [
	| third fourth previous terminal |
	third := JEColumn number: 3.
	fourth := JEColumn number: 4.
	rule := JERule
		head: (NCNonterminal named: 'T')
		body: 	{(NCNonterminal named: 'T'). (NCTerminal character: $+). (NCNonterminal named: 'P')}.
	previous := (rule dotAt: 2) startedAt: first andEndedAt: third.
	terminal := JETerminalItem
		given: (NCTerminal character: $+)
		word: $+
		startedAt: third
		andEndedAt: fourth.
	item := (rule dotAt: 3) startedAt: first andEndedAt: fourth.
	
	self assert: item familiesSize equals: 0.
	previous addFamilyWith: terminal to: item.
	self assert: item familiesSize equals: 1.
	previous addFamilyWith: terminal to: item.
	self assert: item familiesSize equals: 1	
]

{ #category : #tests }
JEDottedItemTest >> testAddFamilyWithTo01 [
	| third fourth previous complete |
	third := JEColumn number: 3.
	fourth := JEColumn number: 4.
	rule := JERule
		head: (NCNonterminal named: 'T')
		body: 	{(NCNonterminal named: 'T'). (NCTerminal character: $+). (NCNonterminal named: 'P')}.

	previous := (rule dotAt: 3) startedAt: first andEndedAt: third.
	complete := 
		(JERule head: (NCNonterminal named: 'P') body: {(NCNonterminal named: 'a')})
			dotAtEnd startedAt: third andEndedAt: fourth.
	item := rule dotAtEnd startedAt: first andEndedAt: fourth.
	
	self assert: item familiesSize equals: 0.
	previous addFamilyWith: complete to: item.
	self assert: item familiesSize equals: 1.
	previous addFamilyWith: complete to: item.
	self assert: item familiesSize equals: 1
]

{ #category : #tests }
JEDottedItemTest >> testAddFamilyWithTo02 [
	| second previous complete |
	second := JEColumn number: 2.
	rule := JERule
		head: (NCNonterminal named: 'T')
		body: 	{(NCNonterminal named: 'T'). (NCTerminal character: $+). (NCNonterminal named: 'P')}.

	previous := rule dotAtBeginning startedAt: first.
	complete := 
		(JERule head: (NCNonterminal named: 'T') body: {(NCNonterminal named: 'a')})
			dotAtEnd startedAt: first andEndedAt: second.
	item := (rule dotAt: 2) startedAt: first andEndedAt: second.
	
	self assert: item familiesSize equals: 0.
	previous addFamilyWith: complete to: item.
	self assert: item familiesSize equals: 1.
	previous addFamilyWith: complete to: item.
	self assert: item familiesSize equals: 1
]

{ #category : #tests }
JEDottedItemTest >> testFamiliesSize [
	rule := JERule head: (NCNonterminal named: 'F') body: {}.
	item := rule dotAtEnd startedAt: first.

	self assert: item familiesSize equals: 1
]

{ #category : #tests }
JEDottedItemTest >> testFamiliesSize01 [
	item := rule dotAtEnd startedAt: first.

	self assert: item familiesSize equals: 0
]

{ #category : #tests }
JEDottedItemTest >> testIsActive [
	item := (rule dotAt: 2) startedAt: first.
	self assert: item isActive.
	self deny: item isPredicted.
	self deny: item isFinal.
		
	item := (rule dotAt: 3) startedAt: first.
	self assert: item isActive.
	self deny: item isPredicted.
	self deny: item isFinal
]

{ #category : #tests }
JEDottedItemTest >> testIsEpsilon [
	rule := JERule head: (NCNonterminal named: 'F') body: {}.
	item := rule dotAtEnd startedAt: first.

	self assert: item isEpsilon
]

{ #category : #tests }
JEDottedItemTest >> testIsFinal [
	item := (rule dotAt: 4) startedAt: first.

	self assert: item isFinal.
	self deny: item isPredicted.
	self deny: item isActive.
	
]

{ #category : #tests }
JEDottedItemTest >> testIsNonterminal [
	item := (rule dotAt: 2) startedAt: first.

	self assert: item isNonterminal.
	self deny: item isTerminal 
]

{ #category : #tests }
JEDottedItemTest >> testIsPredicted [
	item := (rule dotAt: 1) startedAt: first.

	self assert: item isPredicted.
	self deny: item isActive.
	self deny: item isFinal.
	
]

{ #category : #tests }
JEDottedItemTest >> testIsRepresentation [
	rule := JERule
		head: (NCNonterminal named: 'letter y symbol')
		body: {(NCTerminal character: $y)}.
	item := (rule dotAt: 1) startedAt: first.

	self assert: item isRepresentation.
	self assert: item isPredicted.
	self deny: item isActive.
	self deny: item isFinal
]

{ #category : #tests }
JEDottedItemTest >> testIsTerminal [
	item := (rule dotAt: 2) startedAt: first.
	
	self deny: item isTerminal.
	self assert: item isNonterminal 
]
