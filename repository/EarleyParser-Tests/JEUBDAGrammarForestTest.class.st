Class {
	#name : #JEUBDAGrammarForestTest,
	#superclass : #JEParseGrammarTest,
	#category : #'EarleyParser-Tests-Parsing'
}

{ #category : #running }
JEUBDAGrammarForestTest >> setUp [
	super setUp.
	grammar := JEExemplar UBDA
]

{ #category : #tests }
JEUBDAGrammarForestTest >> testParse1X [
	forest := grammar parse: 'x'.

	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1.
	self
		assertCollection: forest leftmostDerivation
		equals: (grammar rulesAtAll: {('A' -> 1). ('letter x symbol' -> 1)})
]

{ #category : #tests }
JEUBDAGrammarForestTest >> testParse2X [
	forest := grammar parse: 'xx'.

	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1.
	self
		assertCollection: forest leftmostDerivation
		equals:
			(grammar
				rulesAtAll:
					{('A' -> 2).
					('A' -> 1).
					('letter x symbol' -> 1).
					('A' -> 1).
					('letter x symbol' -> 1)})
]

{ #category : #tests }
JEUBDAGrammarForestTest >> testParse3Xs [
	forest := grammar parse: 'xxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 2
]

{ #category : #tests }
JEUBDAGrammarForestTest >> testParse4Xs [
	forest := grammar parse: 'xxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 5
]

{ #category : #tests }
JEUBDAGrammarForestTest >> testParse5Xs [
	forest := grammar parse: 'xxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 14
]

{ #category : #tests }
JEUBDAGrammarForestTest >> testParse6Xs [
	forest := grammar parse: 'xxxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 42
]

{ #category : #tests }
JEUBDAGrammarForestTest >> testParse7Xs [
	forest := grammar parse: 'xxxxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 132
]
