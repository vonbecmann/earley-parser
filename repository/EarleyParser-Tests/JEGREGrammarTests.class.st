"
tests for the GRE Grammar.
X -> a | Xb | Ya
Y -> e | YdY

"
Class {
	#name : #JEGREGrammarTests,
	#superclass : #JERecognizeGrammarTest,
	#instVars : [
		'grammar'
	],
	#category : #'EarleyParser-Tests-Grammar'
}

{ #category : #running }
JEGREGrammarTests >> setUp [
	grammar := JEExemplar GRE
]

{ #category : #tests }
JEGREGrammarTests >> testAcceptsed4eabb [
	"(ed)^4eabb"

	self assert: (grammar accepts: 'ededededeabb')
]

{ #category : #tests }
JEGREGrammarTests >> testAcceptsed7eabb [
	"(ed)^7eabb"
	
	self assert: (grammar accepts: 'edededededededeabb')
	
]

{ #category : #tests }
JEGREGrammarTests >> testAcceptsed8eabb [
	"(ed)^8eabb"
	
	self assert: (grammar accepts: 'ededededededededeabb')
	
]

{ #category : #tests }
JEGREGrammarTests >> testAcceptsededea [
	self assert: (grammar accepts: 'ededea')
	
]

{ #category : #tests }
JEGREGrammarTests >> testAcceptsededeab [
	self assert: (grammar accepts: 'ededeab')
	
]

{ #category : #tests }
JEGREGrammarTests >> testAcceptsededeab10 [
	"ededeab^10"
	
	self assert: (grammar accepts: 'ededeabbbbbbbbbb')
	
]

{ #category : #tests }
JEGREGrammarTests >> testAcceptsededeab4 [
	"ededeab^4"
	
	self assert: (grammar accepts: 'ededeabbbb')
	
]
