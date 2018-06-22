"
tests for the UBDA Grammar .
root: A -> x | AA
sentences: x ^ n  (n >=1)

requires time proportional to n^3
"
Class {
	#name : #JEUBDAGrammarTests,
	#superclass : #JERecognizeGrammarTest,
	#category : #'EarleyParser-Tests-Grammar'
}

{ #category : #running }
JEUBDAGrammarTests >> setUp [
	super setUp.
	grammar := JEExemplar UBDA
]

{ #category : #tests }
JEUBDAGrammarTests >> testAccepts1X [
	self assert: (grammar accepts: 'x')
]

{ #category : #tests }
JEUBDAGrammarTests >> testAccepts2Xs [
	self assert: (grammar accepts: 'xx')
	
]

{ #category : #tests }
JEUBDAGrammarTests >> testAccepts3Xs [
	self assert: (grammar accepts: 'xxx')
	
]

{ #category : #tests }
JEUBDAGrammarTests >> testAccepts4Xs [
	self assert: (grammar accepts: 'xxxx')
	
]

{ #category : #tests }
JEUBDAGrammarTests >> testAccepts5Xs [
	self assert: (grammar accepts: 'xxxxx')
	
]

{ #category : #tests }
JEUBDAGrammarTests >> testAccepts6Xs [
	self assert: (grammar accepts: 'xxxxxx')
	
]
