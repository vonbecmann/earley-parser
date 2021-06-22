Class {
	#name : #JELRGrammarTest,
	#superclass : #JERecognizeGrammarTest,
	#category : #'EarleyParser-Tests-Grammar'
}

{ #category : #running }
JELRGrammarTest >> setUp [
	super setUp.
	grammar := JEExemplar LR
]

{ #category : #tests }
JELRGrammarTest >> testAccepts1X [
	self assert: (grammar accepts: 'x')
]

{ #category : #tests }
JELRGrammarTest >> testAccepts2X [
	self assert: (grammar accepts: 'xx')
]

{ #category : #tests }
JELRGrammarTest >> testAccepts3X [
	self assert: (grammar accepts: 'xxx')
]

{ #category : #tests }
JELRGrammarTest >> testAccepts4X [
	self assert: (grammar accepts: 'xxxx')
]

{ #category : #tests }
JELRGrammarTest >> testAccepts5X [
	self assert: (grammar accepts: 'xxxxx')
]

{ #category : #tests }
JELRGrammarTest >> testAccepts6X [
	self assert: (grammar accepts: 'xxxxxx')
]
