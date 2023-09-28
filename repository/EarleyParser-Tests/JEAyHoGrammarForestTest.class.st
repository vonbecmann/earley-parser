Class {
	#name : #JEAyHoGrammarForestTest,
	#superclass : #JEParseGrammarTest,
	#category : #'EarleyParser-Tests-Parsing'
}

{ #category : #running }
JEAyHoGrammarForestTest >> setUp [
	super setUp.
	grammar := JEExemplar AyHo
]

{ #category : #tests }
JEAyHoGrammarForestTest >> testParse1A [
	forest := grammar parse: 'a'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 4
]

{ #category : #tests }
JEAyHoGrammarForestTest >> testParse2A [
	forest := grammar parse: 'aa'.

	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 6
]

{ #category : #tests }
JEAyHoGrammarForestTest >> testParse3A [
	forest := grammar parse: 'aaa'.

	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 4
]

{ #category : #tests }
JEAyHoGrammarForestTest >> testParse4A [
	forest := grammar parse: 'aaaa'.
	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1.
	self
		assertCollection:
			(grammar
				rulesAtAll:
					{('S' -> 1).
					('A' -> 2).
					('letter a symbol' -> 1).
					('A' -> 2).
					('letter a symbol' -> 1).
					('A' -> 2).
					('letter a symbol' -> 1).
					('A' -> 2).
					('letter a symbol' -> 1).})
		equals: forest leftmostDerivation
]

{ #category : #tests }
JEAyHoGrammarForestTest >> testParseEpsilon [
	forest := grammar parse: ''.

	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1.
	self
		assertCollection: (grammar rulesAtAll: {('S'->1). ('A'->1). ('E'->1)})
		equals: forest leftmostDerivation
]
