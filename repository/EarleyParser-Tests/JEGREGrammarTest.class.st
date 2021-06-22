"
tests for the GRE Grammar.
X -> a | Xb | Ya
Y -> e | YdY

"
Class {
	#name : #JEGREGrammarTest,
	#superclass : #JERecognizeGrammarTest,
	#category : #'EarleyParser-Tests-Grammar'
}

{ #category : #running }
JEGREGrammarTest >> setUp [
	super setUp.
	grammar := JEExemplar GRE
]

{ #category : #tests }
JEGREGrammarTest >> testAcceptsed4eabb [
	"(ed)^4eabb"

	self assert: (grammar accepts: 'ededededeabb')
]

{ #category : #tests }
JEGREGrammarTest >> testAcceptsed7eabb [
	"(ed)^7eabb"
	
	self assert: (grammar accepts: 'edededededededeabb')
	
]

{ #category : #tests }
JEGREGrammarTest >> testAcceptsed8eabb [
	"(ed)^8eabb"
	
	self assert: (grammar accepts: 'ededededededededeabb')
	
]

{ #category : #tests }
JEGREGrammarTest >> testAcceptsededea [
	self assert: (grammar accepts: 'ededea')
	
]

{ #category : #tests }
JEGREGrammarTest >> testAcceptsededeab [
	self assert: (grammar accepts: 'ededeab')
	
]

{ #category : #tests }
JEGREGrammarTest >> testAcceptsededeab10 [
	"ededeab^10"
	
	self assert: (grammar accepts: 'ededeabbbbbbbbbb')
	
]

{ #category : #tests }
JEGREGrammarTest >> testAcceptsededeab4 [
	"ededeab^4"
	
	self assert: (grammar accepts: 'ededeabbbb')
	
]
