Class {
	#name : #JE1VWEvaluatorTest,
	#superclass : #TestCase,
	#instVars : [
		'evaluator'
	],
	#category : #'Earley1VW-Tests'
}

{ #category : #asserting }
JE1VWEvaluatorTest >> assertThatEvaluates: aString startingAt: aNonterminalNamed equals: expected [
	self 
		assert: (evaluator evaluate: aString startingAt: aNonterminalNamed) 
		equals: expected
]

{ #category : #initialization }
JE1VWEvaluatorTest >> setUp [
	evaluator := JE1VWParser oneLevelVWEvaluator
]

{ #category : #'tests - notion' }
JE1VWEvaluatorTest >> testEvaluatesNotion01 [
	self assertThatEvaluates: 'left part list' startingAt: 'notion' equals: 'left part list'
]

{ #category : #'tests - notion' }
JE1VWEvaluatorTest >> testEvaluatesNotion02 [
	self assertThatEvaluates: 'left part' startingAt: 'notion' equals: 'left part'
]

{ #category : #'tests - notion' }
JE1VWEvaluatorTest >> testEvaluatesNotion03 [
	self assertThatEvaluates: 'letter' startingAt: 'notion' equals: 'letter'
]

{ #category : #'tests - rule' }
JE1VWEvaluatorTest >> testEvaluatesRule01 [
	self 
		assertThatEvaluates: 'expression:term.' 
		startingAt: 'rule' 
		equals: #(#('expression' #('term')))
]

{ #category : #'tests - rule' }
JE1VWEvaluatorTest >> testEvaluatesRule02 [
	self 
		assertThatEvaluates: 'expression:expression,plus symbol,term.'
		startingAt: 'rule' 
		equals: #(#('expression' #('expression' 'plus symbol' 'term')))
]

{ #category : #'tests - rule' }
JE1VWEvaluatorTest >> testEvaluatesRule03 [
	self 
		assertThatEvaluates: 'expression:.' 
		startingAt: 'rule' 
		equals: #(#('expression' #()))
]

{ #category : #'tests - rule' }
JE1VWEvaluatorTest >> testEvaluatesRule04 [
	self
		assertThatEvaluates: 'expression: term; .'
		startingAt: 'rule'
		equals: #(#('expression' #('term')) #('expression' #()))
]
