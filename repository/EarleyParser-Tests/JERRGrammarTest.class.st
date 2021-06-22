"
tests for the RR Grammar.
A ->  x A | x

"
Class {
	#name : #JERRGrammarTest,
	#superclass : #JERecognizeGrammarTest,
	#category : #'EarleyParser-Tests-Grammar'
}

{ #category : #running }
JERRGrammarTest >> setUp [
	super setUp.
	grammar := JEExemplar RR
]

{ #category : #tests }
JERRGrammarTest >> testAccepts1X [
	self assert: (grammar accepts: 'x')
	
]

{ #category : #tests }
JERRGrammarTest >> testAccepts2Xs [
	self assert: (grammar accepts: 'xx')
]

{ #category : #tests }
JERRGrammarTest >> testAccepts3Xs [
	self assert: (grammar accepts: 'xxx')
]

{ #category : #tests }
JERRGrammarTest >> testAccepts4Xs [
	self assert: (grammar accepts: 'xxxx')
]

{ #category : #tests }
JERRGrammarTest >> testAccepts5Xs [
	self assert: (grammar accepts: 'xxxxx')
]

{ #category : #tests }
JERRGrammarTest >> testAccepts6Xs [
	self assert: (grammar accepts: 'xxxxxx')
]

{ #category : #tests }
JERRGrammarTest >> testAcceptsEpsilon [
	self deny: (grammar accepts: '')
]
