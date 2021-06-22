"
tests for the BP Grammar 
root: 
P -> M N.
M -> epsilon | M a.
N -> epsilon |  N a.

sentences: a ^ n (n>=0)

"
Class {
	#name : #JEBPGrammarTest,
	#superclass : #JERecognizeGrammarTest,
	#category : #'EarleyParser-Tests-Grammar'
}

{ #category : #running }
JEBPGrammarTest >> setUp [
	super setUp.
	grammar := JEExemplar BP
]

{ #category : #tests }
JEBPGrammarTest >> testAccepts1A [
	self assert: (grammar accepts: 'a')
]

{ #category : #tests }
JEBPGrammarTest >> testAccepts2As [
	self assert: (grammar accepts: 'aa')
]

{ #category : #tests }
JEBPGrammarTest >> testAccepts3As [
	self assert: (grammar accepts: 'aaa')
]

{ #category : #tests }
JEBPGrammarTest >> testAccepts4As [
	self assert: (grammar accepts: 'aaaa')
]

{ #category : #tests }
JEBPGrammarTest >> testAcceptsEpsilon [
	self assert: (grammar accepts: '')
]
