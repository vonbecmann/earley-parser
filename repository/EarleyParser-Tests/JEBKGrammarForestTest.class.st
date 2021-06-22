Class {
	#name : #JEBKGrammarForestTest,
	#superclass : #JEParseGrammarTest,
	#category : #'EarleyParser-Tests-Parsing'
}

{ #category : #running }
JEBKGrammarForestTest >> setUp [
	super setUp.
	grammar := JEExemplar BK
]

{ #category : #tests }
JEBKGrammarForestTest >> testParse1X [
	forest := grammar parse: 'x'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 2
]

{ #category : #tests }
JEBKGrammarForestTest >> testParse2X [
	forest := grammar parse: 'xx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 4
]

{ #category : #tests }
JEBKGrammarForestTest >> testParse3Xs [
	forest := grammar parse: 'xxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 8
]

{ #category : #tests }
JEBKGrammarForestTest >> testParse4Xs [
	forest := grammar parse: 'xxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 16
]

{ #category : #tests }
JEBKGrammarForestTest >> testParse5Xs [
	forest := grammar parse: 'xxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 32
]

{ #category : #tests }
JEBKGrammarForestTest >> testParse6Xs [
	forest := grammar parse: 'xxxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 64
]

{ #category : #tests }
JEBKGrammarForestTest >> testParse7Xs [
	forest := grammar parse: 'xxxxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 128
]
