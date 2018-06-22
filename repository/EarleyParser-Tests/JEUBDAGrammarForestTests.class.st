Class {
	#name : #JEUBDAGrammarForestTests,
	#superclass : #JEParseGrammarTest,
	#category : #'EarleyParser-Tests-Parsing'
}

{ #category : #running }
JEUBDAGrammarForestTests >> setUp [
	super setUp.
	grammar := JEExemplar UBDA.
	forest := nil
]

{ #category : #tests }
JEUBDAGrammarForestTests >> testParse1X [
	forest := grammar parse: 'x'.

	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1.
	self
		assertCollection: forest leftmostDerivation
		equals: (grammar rulesAtAll: {('A' -> 1). ('letter x symbol' -> 1)})
]

{ #category : #tests }
JEUBDAGrammarForestTests >> testParse2X [
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
JEUBDAGrammarForestTests >> testParse3Xs [
	forest := grammar parse: 'xxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 2.

]

{ #category : #tests }
JEUBDAGrammarForestTests >> testParse4Xs [
	forest := grammar parse: 'xxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 5.

]

{ #category : #tests }
JEUBDAGrammarForestTests >> testParse5Xs [
	forest := grammar parse: 'xxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 14.

]

{ #category : #tests }
JEUBDAGrammarForestTests >> testParse6Xs [
	forest := grammar parse: 'xxxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 42.

]

{ #category : #tests }
JEUBDAGrammarForestTests >> testParse7Xs [
	forest := grammar parse: 'xxxxxxx'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 132.

]
