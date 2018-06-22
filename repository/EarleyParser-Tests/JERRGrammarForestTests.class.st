Class {
	#name : #JERRGrammarForestTests,
	#superclass : #JEParseGrammarTest,
	#instVars : [
		'grammar',
		'forest'
	],
	#category : #'EarleyParser-Tests-Parsing'
}

{ #category : #running }
JERRGrammarForestTests >> setUp [
	grammar := JEExemplar RR.
	forest := nil
]

{ #category : #tests }
JERRGrammarForestTests >> testParse1X [
	forest := grammar parse: 'x'.

	self deny: forest isAmbiguous.
	self
		assertCollection: forest leftmostDerivation
		equals: (grammar rulesAtAll: {('A' -> 1). ('letter x symbol' -> 1)})
]

{ #category : #tests }
JERRGrammarForestTests >> testParse2Xs [
	forest := grammar parse: 'xx'.
	self deny: forest isAmbiguous.
	self
		assertCollection: forest leftmostDerivation
		equals:
			(grammar
				rulesAtAll:
					{('A' -> 2).
					('letter x symbol' -> 1).
					('A' -> 1).
					('letter x symbol' -> 1)})
]

{ #category : #tests }
JERRGrammarForestTests >> testParse3Xs [
	forest := grammar parse: 'xxx'.
	self deny: forest isAmbiguous.
	self
		assertCollection: forest leftmostDerivation
		equals:
			(grammar
				rulesAtAll:
					{('A' -> 2).
					('letter x symbol' -> 1).
					('A' -> 2).
					('letter x symbol' -> 1).
					('A' -> 1).
					('letter x symbol' -> 1)})
]

{ #category : #tests }
JERRGrammarForestTests >> testParse4Xs [
	forest := grammar parse: 'xxxx'.
	self deny: forest isAmbiguous.
	self
		assertCollection: forest leftmostDerivation
		equals:
			(grammar
				rulesAtAll:
					{('A' -> 2).
					('letter x symbol' -> 1).
					('A' -> 2).
					('letter x symbol' -> 1).
					('A' -> 2).
					('letter x symbol' -> 1).
					('A' -> 1).
					('letter x symbol' -> 1)})
]

{ #category : #tests }
JERRGrammarForestTests >> testParse5Xs [
	forest := grammar parse: 'xxxxx'.
	self deny: forest isAmbiguous.
	self
		assertCollection: forest leftmostDerivation
		equals:
			(grammar
				rulesAtAll:
					{('A' -> 2).
					('letter x symbol' -> 1).
					('A' -> 2).
					('letter x symbol' -> 1).
					('A' -> 2).
					('letter x symbol' -> 1).
					('A' -> 2).
					('letter x symbol' -> 1).
					('A' -> 1).
					('letter x symbol' -> 1)})
]

{ #category : #tests }
JERRGrammarForestTests >> testParse6Xs [
	forest := grammar parse: 'xxxxxx'.
	self deny: forest isAmbiguous.
	self
		assertCollection: forest leftmostDerivation
		equals:
			(grammar
				rulesAtAll:
					{('A' -> 2).
					('letter x symbol' -> 1).
					('A' -> 2).
					('letter x symbol' -> 1).
					('A' -> 2).
					('letter x symbol' -> 1).
					('A' -> 2).
					('letter x symbol' -> 1).
					('A' -> 2).
					('letter x symbol' -> 1).
					('A' -> 1).
					('letter x symbol' -> 1)})
]
