"
tests for the Arithmetic Expressions Grammar.
root: 
	E -> T | E + T
	T -> P | T * P
	P -> a
	

"
Class {
	#name : #JEAEGrammarTest,
	#superclass : #JERecognizeGrammarTest,
	#category : #'EarleyParser-Tests-Grammar'
}

{ #category : #running }
JEAEGrammarTest >> setUp [
	super setUp.
	grammar := JEExemplar AE
]

{ #category : #tests }
JEAEGrammarTest >> testAcceptsMixedExp [
	self assert: (grammar accepts: 'a+a*a+a*a')
]

{ #category : #tests }
JEAEGrammarTest >> testAcceptsMultiplyExp [
	self assert: (grammar accepts: 'a*a')
]

{ #category : #tests }
JEAEGrammarTest >> testAcceptsMultiplyTermStartingAtTerm [
	self assert: (grammar accepts: 'a*a' startingAt: 'T')
]

{ #category : #tests }
JEAEGrammarTest >> testAcceptsPlusExp01 [
	self assert: (grammar accepts: 'a+a')
]

{ #category : #tests }
JEAEGrammarTest >> testAcceptsPlusExp02 [
	self deny: (grammar accepts: 'a+a+')
]

{ #category : #tests }
JEAEGrammarTest >> testAcceptsProductStartingAtTerm [
	self assert: (grammar accepts: 'a' startingAt: 'T')
]

{ #category : #tests }
JEAEGrammarTest >> testAcceptsSimpleExp01 [
	self assert: (grammar accepts: 'a')
]

{ #category : #tests }
JEAEGrammarTest >> testAcceptsSimpleExp02 [
	self deny: (grammar accepts: 'a ')
]

{ #category : #tests }
JEAEGrammarTest >> testAcceptsSimpleExp03 [
	self deny: (grammar accepts: 'a+')
]
