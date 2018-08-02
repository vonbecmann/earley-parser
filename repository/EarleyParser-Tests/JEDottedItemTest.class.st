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
JEDottedItemTest >> testAddFamilyEmpty [
	first := JEColumn number: 1.
	rule := JERule head: (NCNonterminal named: 'F') body: {}.
	item := rule dotAtEnd startedAt: first.
	
	self assert: item familiesSize equals: 1.
	item addFamily: JEFamily empty.
	self assert: item familiesSize equals: 1
]

{ #category : #tests }
JEDottedItemTest >> testAddFamilyEmpty01 [
	first := JEColumn number: 1.
	rule := JERule head: (NCNonterminal named: 'F') body: {}.
	item := rule dotAtEnd startedAt: first.

	self assert: item familiesSize equals: 1.
	item addFamily: JEFamily empty.
	item addFamily: JEFamily empty.
	item addFamily: JEFamily empty.
	self assert: item familiesSize equals: 1
]

{ #category : #tests }
JEDottedItemTest >> testAddFamilyEmpty02 [
	first := JEColumn number: 1.
	rule := JERule head: (NCNonterminal named: 'F') body: {}.
	item := rule dotAtEnd startedAt: first.

	self assert: item familiesSize equals: 1.

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
