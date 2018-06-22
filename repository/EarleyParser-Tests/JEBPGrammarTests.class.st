"
tests for the BP Grammar 
root: 
P -> M N.
M -> epsilon | M a.
N -> epsilon |  N a.

sentences: a ^ n (n>=0)

"
Class {
	#name : #JEBPGrammarTests,
	#superclass : #JERecognizeGrammarTest,
	#instVars : [
		'grammar'
	],
	#category : #'EarleyParser-Tests-Grammar'
}

{ #category : #running }
JEBPGrammarTests >> setUp [
	super setUp.
	grammar := JEExemplar BP
]

{ #category : #tests }
JEBPGrammarTests >> testAccepts1A [
	self assert: (grammar accepts: 'a')
]

{ #category : #tests }
JEBPGrammarTests >> testAccepts2As [
	self assert: (grammar accepts: 'aa')
]

{ #category : #tests }
JEBPGrammarTests >> testAccepts3As [
	self assert: (grammar accepts: 'aaa')
]

{ #category : #tests }
JEBPGrammarTests >> testAccepts4As [
	self assert: (grammar accepts: 'aaaa')
]

{ #category : #tests }
JEBPGrammarTests >> testAcceptsEpsilon [
	self assert: (grammar accepts: '')
]
