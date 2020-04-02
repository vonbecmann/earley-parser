Class {
	#name : #JELRGrammarForestTests,
	#superclass : #JEParseGrammarTest,
	#category : #'EarleyParser-Tests-Parsing'
}

{ #category : #running }
JELRGrammarForestTests >> setUp [
	super setUp.
	grammar := JEExemplar LR
]

{ #category : #tests }
JELRGrammarForestTests >> testParse1X [
	forest := grammar parse: 'x'.

	self deny: forest isAmbiguous.
	self
		assertCollection: forest leftmostDerivation
		equals: (grammar rulesAtAll: {('A' -> 1). ('letter x symbol' -> 1)})
]

{ #category : #tests }
JELRGrammarForestTests >> testParse2X [
	forest := grammar parse: 'xx'.

	self deny: forest isAmbiguous.
	self
		assertCollection: forest leftmostDerivation
		equals: (grammar rulesAtAll: {('A' -> 2). ('A' -> 1). ('letter x symbol' -> 1). ('letter x symbol' -> 1)})
]
