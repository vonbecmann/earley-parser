Class {
	#name : #JEBKGrammarForestTests,
	#superclass : #JEParseGrammarTest,
	#category : #'EarleyParser-Tests-Parsing'
}

{ #category : #running }
JEBKGrammarForestTests >> setUp [
	super setUp.
	grammar := JEExemplar BK
]

{ #category : #tests }
JEBKGrammarForestTests >> testParse1X [
	forest := grammar parse: 'x'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 2
]

{ #category : #tests }
JEBKGrammarForestTests >> testParse2X [
	forest := grammar parse: 'xx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 4
]

{ #category : #tests }
JEBKGrammarForestTests >> testParse3Xs [
	forest := grammar parse: 'xxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 8
]

{ #category : #tests }
JEBKGrammarForestTests >> testParse4Xs [
	forest := grammar parse: 'xxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 16
]

{ #category : #tests }
JEBKGrammarForestTests >> testParse5Xs [
	forest := grammar parse: 'xxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 32
]

{ #category : #tests }
JEBKGrammarForestTests >> testParse6Xs [
	forest := grammar parse: 'xxxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 64
]

{ #category : #tests }
JEBKGrammarForestTests >> testParse7Xs [
	forest := grammar parse: 'xxxxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 128
]
