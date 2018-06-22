Class {
	#name : #JEIdentifierGrammarTests,
	#superclass : #TestCase,
	#instVars : [
		'grammar'
	],
	#category : 'EarleyParser-Tests-Parsing'
}

{ #category : #running }
JEIdentifierGrammarTests >> setUp [
	grammar := JEExemplar identifier
]

{ #category : #tests }
JEIdentifierGrammarTests >> testParse01 [
	| forest |
	forest := grammar parse: 'word_symbol'.
	self deny: forest isAmbiguous.
	self
		assertCollection: forest leftmostDerivation
		equals:
			(grammar
				rulesAtAll:
					{('identifier' -> 1).
					('letter symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 1).
					('word symbol' -> 1).
					('word symbol star' -> 2)})
]

{ #category : #'tests - failure' }
JEIdentifierGrammarTests >> testParseExpectsLetter [
	self
		should: [ grammar parse: ',' ]
		raise: JEFailure
		withExceptionDo: [ :failure | 
			self deny: failure wasAtEnd.						
			self assert: failure position equals: 1.
			self assert: failure actual equals: $,.
			self 
				assertCollection: failure expectedSymbols 
				hasSameElements: {(NCNonterminal named: 'letter symbol')} ]
]
