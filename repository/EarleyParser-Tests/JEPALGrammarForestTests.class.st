Class {
	#name : #JEPALGrammarForestTests,
	#superclass : #JEParseGrammarTest,
	#category : #'EarleyParser-Tests-Parsing'
}

{ #category : #running }
JEPALGrammarForestTests >> setUp [
	super setUp.
	grammar := JEExemplar PAL
]

{ #category : #tests }
JEPALGrammarForestTests >> testParse3Xs [
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
JEPALGrammarForestTests >> testParse5Xs [
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
JEPALGrammarForestTests >> testParse7Xs [
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
