Class {
	#name : #JEAyHoGrammarForestTests,
	#superclass : #TestCase,
	#instVars : [
		'grammar',
		'forest'
	],
	#category : 'EarleyParser-Tests-Parsing'
}

{ #category : #running }
JEAyHoGrammarForestTests >> setUp [
	grammar := JEExemplar AyHo.
	forest := nil
]

{ #category : #tests }
JEAyHoGrammarForestTests >> testParse1A [
	forest := grammar parse: 'a'.
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 4
]

{ #category : #tests }
JEAyHoGrammarForestTests >> testParse2A [
	forest := grammar parse: 'aa'.
	
	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 6
]

{ #category : #tests }
JEAyHoGrammarForestTests >> testParse3A [
	forest := grammar parse: 'aaa'.

	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 4
]

{ #category : #tests }
JEAyHoGrammarForestTests >> testParse4A [
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
JEAyHoGrammarForestTests >> testParseEpsilon [
	forest := grammar parse: ''.
	
	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1.
	self 
		assertCollection: (grammar rulesAtAll: {('S'->1). ('A'->1). ('E'->1)}) 
		equals: forest leftmostDerivation
]
