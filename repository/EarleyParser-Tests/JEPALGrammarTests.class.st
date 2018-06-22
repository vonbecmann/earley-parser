"
tests for the PAL Grammar .
root: A -> x | xAx
sentences: x ^ n  (n >=1, n odd)

unambiguous grammar that requires time n^2  
"
Class {
	#name : #JEPALGrammarTests,
	#superclass : #JERecognizeGrammarTest,
	#category : #'EarleyParser-Tests-Grammar'
}

{ #category : #running }
JEPALGrammarTests >> setUp [
	super setUp.
	grammar := JEExemplar PAL
]

{ #category : #tests }
JEPALGrammarTests >> testAccepts1X [
	self assert: (grammar accepts: 'x')
	
]

{ #category : #tests }
JEPALGrammarTests >> testAccepts3Xs [
	self assert: (grammar accepts: 'xxx')
	
]

{ #category : #tests }
JEPALGrammarTests >> testAccepts5Xs [
	self assert: (grammar accepts: 'xxxxx')
	
]

{ #category : #tests }
JEPALGrammarTests >> testAccepts7Xs [
	self assert: (grammar accepts: 'xxxxxxx')
	
]
