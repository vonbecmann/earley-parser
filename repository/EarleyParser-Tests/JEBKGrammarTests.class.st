"
tests for the BK Grammar .
root: 
K -> epsilon | KJ
J -> F | I
F -> x
I -> x

sentences: x ^ n  (n >=0)


"
Class {
	#name : #JEBKGrammarTests,
	#superclass : #JERecognizeGrammarTest,
	#category : #'EarleyParser-Tests-Grammar'
}

{ #category : #running }
JEBKGrammarTests >> setUp [
	super setUp.
	grammar := JEExemplar BK
]

{ #category : #tests }
JEBKGrammarTests >> testAccepts1X [
	self assert: (grammar accepts: 'x')
]

{ #category : #tests }
JEBKGrammarTests >> testAccepts2Xs [
	self assert: (grammar accepts: 'xx')
	
]

{ #category : #tests }
JEBKGrammarTests >> testAccepts3Xs [
	self assert: (grammar accepts: 'xxx')
	
]

{ #category : #tests }
JEBKGrammarTests >> testAccepts4Xs [
	self assert: (grammar accepts: 'xxxx')
	
]

{ #category : #tests }
JEBKGrammarTests >> testAccepts5Xs [
	self assert: (grammar accepts: 'xxxxx')
	
]

{ #category : #tests }
JEBKGrammarTests >> testAccepts6Xs [
	self assert: (grammar accepts: 'xxxxxx')
	
]

{ #category : #tests }
JEBKGrammarTests >> testAcceptsEpsilon [
	self assert: (grammar accepts: '')
]
