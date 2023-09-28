"
tests for the PAL Grammar .
root: A -> x | xAx
sentences: x ^ n  (n >=1, n odd)

unambiguous grammar that requires time n^2  
"
Class {
	#name : #JEPALGrammarTest,
	#superclass : #JERecognizeGrammarTest,
	#category : #'EarleyParser-Tests-Grammar'
}

{ #category : #running }
JEPALGrammarTest >> setUp [
	super setUp.
	grammar := JEExemplar PAL
]

{ #category : #tests }
JEPALGrammarTest >> testAccepts1X [
	self assert: (grammar accepts: 'x')
]

{ #category : #tests }
JEPALGrammarTest >> testAccepts3Xs [
	self assert: (grammar accepts: 'xxx')
]

{ #category : #tests }
JEPALGrammarTest >> testAccepts5Xs [
	self assert: (grammar accepts: 'xxxxx')
]

{ #category : #tests }
JEPALGrammarTest >> testAccepts7Xs [
	self assert: (grammar accepts: 'xxxxxxx')
]
