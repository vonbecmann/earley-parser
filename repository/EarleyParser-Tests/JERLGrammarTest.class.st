Class {
	#name : #JERLGrammarTest,
	#superclass : #JERecognizeGrammarTest,
	#category : #'EarleyParser-Tests-Grammar'
}

{ #category : #running }
JERLGrammarTest >> setUp [
	super setUp.
	grammar := JEExemplar RL
]

{ #category : #tests }
JERLGrammarTest >> testAccepts1A [
	self assert: (grammar accepts: 'a')
]

{ #category : #tests }
JERLGrammarTest >> testAccepts2A [
	self assert: (grammar accepts: 'aa')
]

{ #category : #tests }
JERLGrammarTest >> testAccepts2AB [
	self assert: (grammar accepts: 'aab')
]

{ #category : #tests }
JERLGrammarTest >> testAccepts3A [
	self assert: (grammar accepts: 'aaa')
]

{ #category : #tests }
JERLGrammarTest >> testAccepts4A3B [
	self assert: (grammar accepts: 'aaaabbb')
]
