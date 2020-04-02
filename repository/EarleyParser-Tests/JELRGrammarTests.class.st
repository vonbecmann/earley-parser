Class {
	#name : #JELRGrammarTests,
	#superclass : #JERecognizeGrammarTest,
	#category : #'EarleyParser-Tests-Grammar'
}

{ #category : #running }
JELRGrammarTests >> setUp [
	super setUp.
	grammar := JEExemplar LR
]

{ #category : #tests }
JELRGrammarTests >> testAccepts1X [
	self assert: (grammar accepts: 'x')
]

{ #category : #tests }
JELRGrammarTests >> testAccepts2X [
	self assert: (grammar accepts: 'xx')
]

{ #category : #tests }
JELRGrammarTests >> testAccepts3X [
	self assert: (grammar accepts: 'xxx')
]

{ #category : #tests }
JELRGrammarTests >> testAccepts4X [
	self assert: (grammar accepts: 'xxxx')
]

{ #category : #tests }
JELRGrammarTests >> testAccepts5X [
	self assert: (grammar accepts: 'xxxxx')
]

{ #category : #tests }
JELRGrammarTests >> testAccepts6X [
	self assert: (grammar accepts: 'xxxxxx')
]
