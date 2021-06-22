Class {
	#name : #JEEpsilonRuleTest,
	#superclass : #TestCase,
	#instVars : [
		'epsilonRule'
	],
	#category : #'EarleyParser-Tests-Implementation'
}

{ #category : #running }
JEEpsilonRuleTest >> setUp [
	super setUp.
	epsilonRule := JERule head: (NCNonterminal named: 'T') body: #()
]

{ #category : #tests }
JEEpsilonRuleTest >> testEpsilonRuleAsString [
	self assert: epsilonRule asString equals: 'T: .'
]

{ #category : #tests }
JEEpsilonRuleTest >> testEpsilonRuleIsEpsilon [
	self assert: epsilonRule isEpsilon
]

{ #category : #tests }
JEEpsilonRuleTest >> testEpsilonRuleWithDotAtBeginningAsString [
	self assert: epsilonRule dotAtBeginning asString equals: 'T: ·.'
]

{ #category : #tests }
JEEpsilonRuleTest >> testEpsilonRuleWithDotAtBeginningIsFinal [
	self assert: epsilonRule dotAtBeginning isFinal
]

{ #category : #tests }
JEEpsilonRuleTest >> testEpsilonRuleWithDotAtBeginningIsNotPredicted [
	self deny: epsilonRule dotAtBeginning isPredicted
]

{ #category : #tests }
JEEpsilonRuleTest >> testEpsilonRuleWithDotAtEndAsString [
	self assert: epsilonRule dotAtEnd asString equals: 'T: ·.'
]

{ #category : #tests }
JEEpsilonRuleTest >> testEpsilonRuleWithDotAtEndIsFinal [
	self assert: epsilonRule dotAtEnd isFinal
]

{ #category : #tests }
JEEpsilonRuleTest >> testEpsilonRuleWithDotAtEndIsNotPredicted [
	self deny: epsilonRule dotAtEnd isPredicted
]
