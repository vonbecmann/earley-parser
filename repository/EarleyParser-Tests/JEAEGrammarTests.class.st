"
tests for the Arithmetic Expressions Grammar.
root: 
	E -> T | E + T
	T -> P | T * P
	P -> a
	

"
Class {
	#name : #JEAEGrammarTests,
	#superclass : #JERecognizeGrammarTest,
	#category : #'EarleyParser-Tests-Grammar'
}

{ #category : #running }
JEAEGrammarTests >> setUp [
	super setUp.
	grammar := JEExemplar AE
]

{ #category : #tests }
JEAEGrammarTests >> testAcceptsMixedExp [
	self assert: (grammar accepts: 'a+a*a+a*a')
]

{ #category : #tests }
JEAEGrammarTests >> testAcceptsMultiplyExp [
	self assert: (grammar accepts: 'a*a')
]

{ #category : #tests }
JEAEGrammarTests >> testAcceptsMultiplyTermStartingAtTerm [
	self assert: (grammar accepts: 'a*a' startingAt: 'T')
]

{ #category : #tests }
JEAEGrammarTests >> testAcceptsPlusExp01 [
	self assert: (grammar accepts: 'a+a')
]

{ #category : #tests }
JEAEGrammarTests >> testAcceptsPlusExp02 [
	self deny: (grammar accepts: 'a+a+')
]

{ #category : #tests }
JEAEGrammarTests >> testAcceptsProductStartingAtTerm [
	self assert: (grammar accepts: 'a' startingAt: 'T')
]

{ #category : #tests }
JEAEGrammarTests >> testAcceptsSimpleExp01 [
	self assert: (grammar accepts: 'a')
]

{ #category : #tests }
JEAEGrammarTests >> testAcceptsSimpleExp02 [
	self deny: (grammar accepts: 'a ')
]

{ #category : #tests }
JEAEGrammarTests >> testAcceptsSimpleExp03 [
	self deny: (grammar accepts: 'a+')
]
