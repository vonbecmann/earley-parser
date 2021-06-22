Class {
	#name : #JEPALGrammarForestTest,
	#superclass : #JEParseGrammarTest,
	#category : #'EarleyParser-Tests-Parsing'
}

{ #category : #running }
JEPALGrammarForestTest >> setUp [
	super setUp.
	grammar := JEExemplar PAL
]

{ #category : #tests }
JEPALGrammarForestTest >> testParse3Xs [
	forest := grammar parse: 'xxx'.
	self deny: forest isAmbiguous.
	self
		assertCollection:
			(grammar
				rulesAtAll:
					{('A' -> 2).
					('letter x symbol' -> 1).
					('A' -> 1).
					('letter x symbol' -> 1).
					('letter x symbol' -> 1)})
		equals: forest leftmostDerivation
]

{ #category : #tests }
JEPALGrammarForestTest >> testParse5Xs [
	forest := grammar parse: 'xxxxx'.
	self deny: forest isAmbiguous.
	self
		assertCollection:
			(grammar
				rulesAtAll:
					{('A' -> 2).
					('letter x symbol' -> 1).
					('A' -> 2).
					('letter x symbol' -> 1).
					('A' -> 1).
					('letter x symbol' -> 1).
					('letter x symbol' -> 1).
					('letter x symbol' -> 1)})
		equals: forest leftmostDerivation
]

{ #category : #tests }
JEPALGrammarForestTest >> testParse7Xs [
	forest := grammar parse: 'xxxxxxx'.
	self deny: forest isAmbiguous.
	self
		assertCollection:
			(grammar
				rulesAtAll:
					{('A' -> 2).
					('letter x symbol' -> 1).
					('A' -> 2).
					('letter x symbol' -> 1).
					('A' -> 2).
					('letter x symbol' -> 1).
					('A' -> 1).
					('letter x symbol' -> 1).
					('letter x symbol' -> 1).
					('letter x symbol' -> 1).
					('letter x symbol' -> 1)})
		equals: forest leftmostDerivation
]
