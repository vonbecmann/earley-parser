Class {
	#name : #JERLGrammarTests,
	#superclass : #TestCase,
	#instVars : [
		'grammar'
	],
	#category : #'EarleyParser-Tests-Grammar'
}

{ #category : #initialization }
JERLGrammarTests >> setUp [
	grammar := JEExemplar RL
]

{ #category : #tests }
JERLGrammarTests >> testAccepts1A [
	self assert: (grammar accepts: 'a')
]

{ #category : #tests }
JERLGrammarTests >> testAccepts2A [
	self assert: (grammar accepts: 'aa')
]

{ #category : #tests }
JERLGrammarTests >> testAccepts2AB [
	self assert: (grammar accepts: 'aab')
]

{ #category : #tests }
JERLGrammarTests >> testAccepts3A [
	self assert: (grammar accepts: 'aaa')
]

{ #category : #tests }
JERLGrammarTests >> testAccepts4A3B [
	self assert: (grammar accepts: 'aaaabbb')
]
