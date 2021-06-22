"
parsing tests for the BK Grammar .
"
Class {
	#name : #JEBKGrammarParseTest,
	#superclass : #JEParseGrammarTest,
	#category : #'EarleyParser-Tests-Parsing'
}

{ #category : #running }
JEBKGrammarParseTest >> setUp [
	super setUp.
	grammar := JEExemplar BK
]

{ #category : #tests }
JEBKGrammarParseTest >> testParse1X [
	forest := grammar parse: 'x'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 2
]

{ #category : #tests }
JEBKGrammarParseTest >> testParse2X [
	forest := grammar parse: 'xx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 4
]

{ #category : #tests }
JEBKGrammarParseTest >> testParse3Xs [
	forest := grammar parse: 'xxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 8
]

{ #category : #tests }
JEBKGrammarParseTest >> testParse4Xs [
	forest := grammar parse: 'xxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 16
]

{ #category : #tests }
JEBKGrammarParseTest >> testParse5Xs [
	forest := grammar parse: 'xxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 32
]

{ #category : #tests }
JEBKGrammarParseTest >> testParse6Xs [
	forest := grammar parse: 'xxxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 64
]

{ #category : #tests }
JEBKGrammarParseTest >> testParse7Xs [
	forest := grammar parse: 'xxxxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 128
]

{ #category : #tests }
JEBKGrammarParseTest >> testParseEpsilon [
	forest := grammar parse: ''.
	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1
]
