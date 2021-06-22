Class {
	#name : #JEUBDAGrammarParseTest,
	#superclass : #JEParseGrammarTest,
	#category : #'EarleyParser-Tests-Parsing'
}

{ #category : #running }
JEUBDAGrammarParseTest >> setUp [
	super setUp.
	grammar := JEExemplar UBDA
]

{ #category : #tests }
JEUBDAGrammarParseTest >> testParse1X [
	forest := grammar parse: 'x'.
	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1
]

{ #category : #tests }
JEUBDAGrammarParseTest >> testParse2X [
	forest := grammar parse: 'xx'.
	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1
]

{ #category : #tests }
JEUBDAGrammarParseTest >> testParse3X [
	forest := grammar parse: 'xxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 2
]

{ #category : #tests }
JEUBDAGrammarParseTest >> testParse4X [
	forest := grammar parse: 'xxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 5
]

{ #category : #tests }
JEUBDAGrammarParseTest >> testParse5X [
	forest := grammar parse: 'xxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 14
]

{ #category : #tests }
JEUBDAGrammarParseTest >> testParse6X [
	forest := grammar parse: 'xxxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 42
]

{ #category : #tests }
JEUBDAGrammarParseTest >> testParse7X [
	forest := grammar parse: 'xxxxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 132
]
