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
	#name : #JEBKGrammarTest,
	#superclass : #JERecognizeGrammarTest,
	#category : #'EarleyParser-Tests-Grammar'
}

{ #category : #running }
JEBKGrammarTest >> setUp [
	super setUp.
	grammar := JEExemplar BK
]

{ #category : #tests }
JEBKGrammarTest >> testAccepts1X [
	self assert: (grammar accepts: 'x')
]

{ #category : #tests }
JEBKGrammarTest >> testAccepts2Xs [
	self assert: (grammar accepts: 'xx')
	
]

{ #category : #tests }
JEBKGrammarTest >> testAccepts3Xs [
	self assert: (grammar accepts: 'xxx')
	
]

{ #category : #tests }
JEBKGrammarTest >> testAccepts4Xs [
	self assert: (grammar accepts: 'xxxx')
	
]

{ #category : #tests }
JEBKGrammarTest >> testAccepts5Xs [
	self assert: (grammar accepts: 'xxxxx')
	
]

{ #category : #tests }
JEBKGrammarTest >> testAccepts6Xs [
	self assert: (grammar accepts: 'xxxxxx')
	
]

{ #category : #tests }
JEBKGrammarTest >> testAcceptsEpsilon [
	self assert: (grammar accepts: '')
]
