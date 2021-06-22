Class {
	#name : #JELRGrammarForestTest,
	#superclass : #JEParseGrammarTest,
	#category : #'EarleyParser-Tests-Parsing'
}

{ #category : #running }
JELRGrammarForestTest >> setUp [
	super setUp.
	grammar := JEExemplar LR
]

{ #category : #tests }
JELRGrammarForestTest >> testParse1X [
	forest := grammar parse: 'x'.

	self deny: forest isAmbiguous.
	self
		assertCollection: forest leftmostDerivation
		equals: (grammar rulesAtAll: {('A' -> 1). ('letter x symbol' -> 1)})
]

{ #category : #tests }
JELRGrammarForestTest >> testParse2X [
	forest := grammar parse: 'xx'.

	self deny: forest isAmbiguous.
	self
		assertCollection: forest leftmostDerivation
		equals: (grammar rulesAtAll: {('A' -> 2). ('A' -> 1). ('letter x symbol' -> 1). ('letter x symbol' -> 1)})
]
