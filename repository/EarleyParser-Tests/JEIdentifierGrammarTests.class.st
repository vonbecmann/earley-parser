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
	grammar := JEGrammar
		productionRules:
			#(	#('identifier' #('letter symbol' 'word symbol star')) 
				#('word symbol star' #('word symbol' 'word symbol star')) 
				#('word symbol star' #()))
		representations:
			{('letter symbol' -> (NCTerminal charSet: ($a to: $z), ($A to: $Z))).
			('word symbol' -> (NCTerminal charSet: ($a to: $z), ($A to: $Z), ($0 to: $9), '_'))}
]

{ #category : #tests }
JEIdentifierGrammarTests >> testEmpty [
	self deny: (grammar accepts: '')
]

{ #category : #tests }
JEIdentifierGrammarTests >> testOneLetter [
	self assert: (grammar accepts: 'a').
	self assert: (grammar accepts: 'A')
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
			self assert: failure position equals: 1.
			self 
				assertCollection: failure expectedSymbols 
				hasSameElements: {(NCNonterminal named: 'letter symbol')} ]
]

{ #category : #tests }
JEIdentifierGrammarTests >> testTwoLetters [
	self assert: (grammar accepts: 'a_').
	self assert: (grammar accepts: 'a2').
	self assert: (grammar accepts: 'A_').
	self assert: (grammar accepts: 'A3')
]
