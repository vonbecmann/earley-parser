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
			self assert: failure wasAtEnd.
			self
				assertCollection: failure expectedSymbols
				hasSameElements: {(NCNonterminal named: 'letter a symbol')} ]
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
			self deny: failure wasAtEnd.			
			self assert: failure position equals: 2.
			self assert: failure actual equals: Character space.
			self
				assertCollection: failure expectedSymbols
				hasSameElements: {	(NCNonterminal named: 'star symbol').
										(NCNonterminal named: 'plus symbol')} ]
]

{ #category : #'tests - failure' }
JEAEGrammarParseTests >> testParseSimpleExp03 [
	self
		should: [ grammar parse: 'a+' ]
		raise: JEFailure
		withExceptionDo: [ :failure | 
			self assert: failure wasAtEnd.			
			self
				assertCollection: failure expectedSymbols
				hasSameElements: {	(NCNonterminal named: 'T').
										(NCNonterminal named: 'letter a symbol')}	]
]

{ #category : #'tests - failure' }
JEAEGrammarParseTests >> testParseSimpleExp04 [
	self
		should: [ grammar parse: 'a++' ]
		raise: JEFailure
		withExceptionDo: [ :failure | 
			self deny: failure wasAtEnd.			
			self assert: failure position equals: 3.
			self assert: failure actual equals: $+.
			self
				assertCollection: failure expectedSymbols
				hasSameElements:
					{(NCNonterminal named: 'T').
					(NCNonterminal named: 'letter a symbol')} ]
]

{ #category : #'tests - failure' }
JEAEGrammarParseTests >> testParseSimpleExp05 [
	self
		should: [ grammar parse: 'a+*' ]
		raise: JEFailure
		withExceptionDo: [ :failure | 
			self deny: failure wasAtEnd.						
			self assert: failure position equals: 3.
			self assert: failure actual equals: $*.
			self
				assertCollection: failure expectedSymbols
				hasSameElements:
					{(NCNonterminal named: 'T').
					(NCNonterminal named: 'letter a symbol')} ]
]

{ #category : #'tests - failure' }
JEAEGrammarParseTests >> testParseSimpleExp06 [
	self
		should: [ grammar parse: 'a*' ]
		raise: JEFailure
		withExceptionDo: [ :failure | 
			self assert: failure wasAtEnd.						
			self
				assertCollection: failure expectedSymbols
				hasSameElements:
					{(NCNonterminal named: 'P').
					(NCNonterminal named: 'letter a symbol')} ]
]
