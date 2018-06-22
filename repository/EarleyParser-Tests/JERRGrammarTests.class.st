"
tests for the RR Grammar.
A ->  x A | x

"
Class {
	#name : #JERRGrammarTests,
	#superclass : #JERecognizeGrammarTest,
	#category : #'EarleyParser-Tests-Grammar'
}

{ #category : #running }
JERRGrammarTests >> setUp [
	super setUp.
	grammar := JEExemplar RR
]

{ #category : #tests }
JERRGrammarTests >> testAccepts1X [
	self assert: (grammar accepts: 'x')
	
]

{ #category : #tests }
JERRGrammarTests >> testAccepts2Xs [
	self assert: (grammar accepts: 'xx')
]

{ #category : #tests }
JERRGrammarTests >> testAccepts3Xs [
	self assert: (grammar accepts: 'xxx')
]

{ #category : #tests }
JERRGrammarTests >> testAccepts4Xs [
	self assert: (grammar accepts: 'xxxx')
]

{ #category : #tests }
JERRGrammarTests >> testAccepts5Xs [
	self assert: (grammar accepts: 'xxxxx')
]

{ #category : #tests }
JERRGrammarTests >> testAccepts6Xs [
	self assert: (grammar accepts: 'xxxxxx')
]

{ #category : #tests }
JERRGrammarTests >> testAcceptsEpsilon [
	self deny: (grammar accepts: '')
]
