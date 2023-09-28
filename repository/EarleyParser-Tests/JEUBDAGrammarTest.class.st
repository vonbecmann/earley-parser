"
tests for the UBDA Grammar .
root: A -> x | AA
sentences: x ^ n  (n >=1)

requires time proportional to n^3
"
Class {
	#name : #JEUBDAGrammarTest,
	#superclass : #JERecognizeGrammarTest,
	#category : #'EarleyParser-Tests-Grammar'
}

{ #category : #running }
JEUBDAGrammarTest >> setUp [
	super setUp.
	grammar := JEExemplar UBDA
]

{ #category : #tests }
JEUBDAGrammarTest >> testAccepts1X [
	self assert: (grammar accepts: 'x')
]

{ #category : #tests }
JEUBDAGrammarTest >> testAccepts2Xs [
	self assert: (grammar accepts: 'xx')
]

{ #category : #tests }
JEUBDAGrammarTest >> testAccepts3Xs [
	self assert: (grammar accepts: 'xxx')
]

{ #category : #tests }
JEUBDAGrammarTest >> testAccepts4Xs [
	self assert: (grammar accepts: 'xxxx')
]

{ #category : #tests }
JEUBDAGrammarTest >> testAccepts5Xs [
	self assert: (grammar accepts: 'xxxxx')
]

{ #category : #tests }
JEUBDAGrammarTest >> testAccepts6Xs [
	self assert: (grammar accepts: 'xxxxxx')
]
