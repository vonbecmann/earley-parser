Class {
	#name : #JEEpsilonRuleTests,
	#superclass : #TestCase,
	#instVars : [
		'epsilonRule'
	],
	#category : 'EarleyParser-Tests-Implementation'
}

{ #category : #running }
JEEpsilonRuleTests >> setUp [
	super setUp.
	epsilonRule := JERule head: (JENonterminal named: 'T') body: #()
]

{ #category : #tests }
JEEpsilonRuleTests >> testEpsilonRuleAsString [
	self assert: epsilonRule asString equals: 'T: .'
]

{ #category : #tests }
JEEpsilonRuleTests >> testEpsilonRuleIsEpsilon [
	self assert: epsilonRule isEpsilon
]

{ #category : #tests }
JEEpsilonRuleTests >> testEpsilonRuleWithDotAtBeginningAsString [
	self assert: epsilonRule dotAtBeginning asString equals: 'T: ·.'
]

{ #category : #tests }
JEEpsilonRuleTests >> testEpsilonRuleWithDotAtBeginningIsFinal [
	self assert: epsilonRule dotAtBeginning isFinal
]

{ #category : #tests }
JEEpsilonRuleTests >> testEpsilonRuleWithDotAtBeginningIsNotPredicted [
	self deny: epsilonRule dotAtBeginning isPredicted
]

{ #category : #tests }
JEEpsilonRuleTests >> testEpsilonRuleWithDotAtEndAsString [
	self assert: epsilonRule dotAtEnd asString equals: 'T: ·.'
]

{ #category : #tests }
JEEpsilonRuleTests >> testEpsilonRuleWithDotAtEndIsFinal [
	self assert: epsilonRule dotAtEnd isFinal
]

{ #category : #tests }
JEEpsilonRuleTests >> testEpsilonRuleWithDotAtEndIsNotPredicted [
	self deny: epsilonRule dotAtEnd isPredicted
]
