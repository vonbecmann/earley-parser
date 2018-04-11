"
parsing tests for the BK Grammar .
"
Class {
	#name : #JEBKGrammarParseTests,
	#superclass : #TestCase,
	#instVars : [
		'grammar',
		'forest'
	],
	#category : 'EarleyParser-Tests-Parsing'
}

{ #category : #running }
JEBKGrammarParseTests >> setUp [
	grammar := JEExemplar BK.
	forest := nil
]

{ #category : #tests }
JEBKGrammarParseTests >> testParse1X [
	forest := grammar parse: 'x'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 2
]

{ #category : #tests }
JEBKGrammarParseTests >> testParse2X [
	forest := grammar parse: 'xx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 4
]

{ #category : #tests }
JEBKGrammarParseTests >> testParse3Xs [
	forest := grammar parse: 'xxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 8
]

{ #category : #tests }
JEBKGrammarParseTests >> testParse4Xs [
	forest := grammar parse: 'xxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 16
]

{ #category : #tests }
JEBKGrammarParseTests >> testParse5Xs [
	forest := grammar parse: 'xxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 32
]

{ #category : #tests }
JEBKGrammarParseTests >> testParse6Xs [
	forest := grammar parse: 'xxxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 64
]

{ #category : #tests }
JEBKGrammarParseTests >> testParse7Xs [
	forest := grammar parse: 'xxxxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 128
]

{ #category : #tests }
JEBKGrammarParseTests >> testParseEpsilon [
	forest := grammar parse: ''.
	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1
]
