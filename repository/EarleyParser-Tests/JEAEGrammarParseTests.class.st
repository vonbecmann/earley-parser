"
arithmetic grammar parse tests.

"
Class {
	#name : #JEAEGrammarParseTests,
	#superclass : #TestCase,
	#instVars : [
		'grammar',
		'forest'
	],
	#category : 'EarleyParser-Tests-Parsing'
}

{ #category : #running }
JEAEGrammarParseTests >> setUp [
	grammar := JEExemplar AE.
	forest := nil
]

{ #category : #'tests - failure' }
JEAEGrammarParseTests >> testParseEmpty [
	self
		should: [ grammar parse: '' ]
		raise: JEFailure
		withExceptionDo: [ :failure | 
			self assert: failure position equals: 1.
			self
				assertCollection: failure expectedSymbols
				hasSameElements: {(JENonterminal named: 'letter a symbol')} ]
]

{ #category : #tests }
JEAEGrammarParseTests >> testParseMixedExp [
	forest := grammar parse: 'a+a*a+a*a'.

	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1
]

{ #category : #tests }
JEAEGrammarParseTests >> testParseMultiplyExp [
	forest := grammar parse: 'a*a'.

	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1
]

{ #category : #tests }
JEAEGrammarParseTests >> testParsePlusExp [
	forest := grammar parse: 'a+a'.
	
	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1
]

{ #category : #tests }
JEAEGrammarParseTests >> testParseSimpleExp01 [
	forest := grammar parse: 'a'.

	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1
]

{ #category : #'tests - failure' }
JEAEGrammarParseTests >> testParseSimpleExp02 [
	self
		should: [ grammar parse: 'a ' ]
		raise: JEFailure
		withExceptionDo: [ :failure | 
			self assert: failure position equals: 2.
			self
				assertCollection: failure expectedSymbols
				hasSameElements: {	(JENonterminal named: 'star symbol').
										(JENonterminal named: 'plus symbol')} ]
]

{ #category : #'tests - failure' }
JEAEGrammarParseTests >> testParseSimpleExp03 [
	self
		should: [ grammar parse: 'a+' ]
		raise: JEFailure
		withExceptionDo: [ :failure | 
			self assert: failure position equals: 3.
			self
				assertCollection: failure expectedSymbols
				hasSameElements: {	(JENonterminal named: 'T').
										(JENonterminal named: 'letter a symbol')}	]
]

{ #category : #'tests - failure' }
JEAEGrammarParseTests >> testParseSimpleExp04 [
	self
		should: [ grammar parse: 'a++' ]
		raise: JEFailure
		withExceptionDo: [ :failure | 
			self assert: failure position equals: 3.
			self
				assertCollection: failure expectedSymbols
				hasSameElements:
					{(JENonterminal named: 'T').
					(JENonterminal named: 'letter a symbol')} ]
]

{ #category : #'tests - failure' }
JEAEGrammarParseTests >> testParseSimpleExp05 [
	self
		should: [ grammar parse: 'a+*' ]
		raise: JEFailure
		withExceptionDo: [ :failure | 
			self assert: failure position equals: 3.
			self
				assertCollection: failure expectedSymbols
				hasSameElements:
					{(JENonterminal named: 'T').
					(JENonterminal named: 'letter a symbol')} ]
]

{ #category : #'tests - failure' }
JEAEGrammarParseTests >> testParseSimpleExp06 [
	self
		should: [ grammar parse: 'a*' ]
		raise: JEFailure
		withExceptionDo: [ :failure | 
			self assert: failure position equals: 3.
			self
				assertCollection: failure expectedSymbols
				hasSameElements:
					{(JENonterminal named: 'P').
					(JENonterminal named: 'letter a symbol')} ]
]
