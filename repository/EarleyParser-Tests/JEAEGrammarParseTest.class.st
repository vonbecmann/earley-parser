"
arithmetic grammar parse tests.

"
Class {
	#name : #JEAEGrammarParseTest,
	#superclass : #JEParseGrammarTest,
	#category : #'EarleyParser-Tests-Parsing'
}

{ #category : #running }
JEAEGrammarParseTest >> setUp [
	super setUp.
	grammar := JEExemplar AE
]

{ #category : #'tests - failure' }
JEAEGrammarParseTest >> testParseEmpty [
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
JEAEGrammarParseTest >> testParseMixedExp [
	forest := grammar parse: 'a+a*a+a*a'.

	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1
]

{ #category : #tests }
JEAEGrammarParseTest >> testParseMultiplyExp [
	forest := grammar parse: 'a*a'.

	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1
]

{ #category : #tests }
JEAEGrammarParseTest >> testParsePlusExp [
	forest := grammar parse: 'a+a'.
	
	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1
]

{ #category : #tests }
JEAEGrammarParseTest >> testParseSimpleExp01 [
	forest := grammar parse: 'a'.

	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1
]

{ #category : #'tests - failure' }
JEAEGrammarParseTest >> testParseSimpleExp02 [
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
JEAEGrammarParseTest >> testParseSimpleExp03 [
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
JEAEGrammarParseTest >> testParseSimpleExp04 [
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
JEAEGrammarParseTest >> testParseSimpleExp05 [
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
JEAEGrammarParseTest >> testParseSimpleExp06 [
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
