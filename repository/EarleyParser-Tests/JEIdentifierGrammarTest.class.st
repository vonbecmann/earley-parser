"
identifier grammar tests.

"
Class {
	#name : #JEIdentifierGrammarTest,
	#superclass : #JERecognizeGrammarTest,
	#category : #'EarleyParser-Tests-Grammar'
}

{ #category : #running }
JEIdentifierGrammarTest >> setUp [
	super setUp.
	grammar := JEExemplar identifier
]

{ #category : #tests }
JEIdentifierGrammarTest >> testAcceptsEmpty [
	self deny: (grammar accepts: '')
]

{ #category : #tests }
JEIdentifierGrammarTest >> testAcceptsOneLetter [
	self assert: (grammar accepts: 'a').
	self assert: (grammar accepts: 'A')
]

{ #category : #tests }
JEIdentifierGrammarTest >> testAcceptsTwoLetters [
	self assert: (grammar accepts: 'a_').
	self assert: (grammar accepts: 'a2').
	self assert: (grammar accepts: 'A_').
	self assert: (grammar accepts: 'A3')
]
