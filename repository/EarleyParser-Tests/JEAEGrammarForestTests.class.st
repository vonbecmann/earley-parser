Class {
	#name : #JEAEGrammarForestTests,
	#superclass : #TestCase,
	#instVars : [
		'grammar',
		'forest'
	],
	#category : 'EarleyParser-Tests-Parsing'
}

{ #category : #running }
JEAEGrammarForestTests >> setUp [
	grammar := JEExemplar AE.
	forest := nil
]

{ #category : #tests }
JEAEGrammarForestTests >> testLeftmostDerivationMixedExp [
	forest := grammar parse: 'a+a*a+a*a'.
	
	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1.
	self
		assertCollection:
			(grammar
				rulesAtAll:
					{('E' -> 2).
					('E' -> 2).
					('E' -> 1).
					('T' -> 1).
					('P' -> 1).
					('letter a symbol' -> 1).
					('plus symbol' -> 1).
					('T' -> 2).
					('T' -> 1).
					('P' -> 1).
					('letter a symbol' -> 1).
					('star symbol' -> 1).
					('P' -> 1).
					('letter a symbol' -> 1).
					('plus symbol' -> 1).
					('T' -> 2).
					('T' -> 1).
					('P' -> 1).
					('letter a symbol' -> 1).
					('star symbol' -> 1).
					('P' -> 1).
					('letter a symbol' -> 1).
					})
		equals: forest leftmostDerivation 
]

{ #category : #tests }
JEAEGrammarForestTests >> testLeftmostDerivationMultiplyExp [
	forest := grammar parse: 'a*a'.
	
	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1.
	self
		assertCollection:
			(grammar
				rulesAtAll:
					{('E' -> 1).
					('T' -> 2).
					('T' -> 1).
					('P' -> 1).
					('letter a symbol' -> 1).
					('star symbol' -> 1).
					('P' -> 1).
					('letter a symbol' -> 1).})
		equals: forest leftmostDerivation
		
]

{ #category : #tests }
JEAEGrammarForestTests >> testLeftmostDerivationPlusExp [
	forest := grammar parse: 'a+a'.

	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1.
	self
		assertCollection:
			(grammar
				rulesAtAll:
					{('E' -> 2).
					('E' -> 1).
					('T' -> 1).
					('P' -> 1).
					('letter a symbol' -> 1).
					('plus symbol' -> 1).
					('T' -> 1).
					('P' -> 1).
					('letter a symbol' -> 1).})
		equals: forest leftmostDerivation
		
]

{ #category : #tests }
JEAEGrammarForestTests >> testParseMixedExp [
	forest := grammar parse: 'a+a*a+a*a'.

	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1
]

{ #category : #tests }
JEAEGrammarForestTests >> testParseMultiplyExp [
	forest := grammar parse: 'a*a'.

	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1
]

{ #category : #tests }
JEAEGrammarForestTests >> testParsePlusExp [
	forest := grammar parse: 'a+a'.
	
	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1
]

{ #category : #tests }
JEAEGrammarForestTests >> testParseSimpleExp01 [
	forest := grammar parse: 'a'.

	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1
]

{ #category : #'tests - failure' }
JEAEGrammarForestTests >> testParseSimpleExp02 [
	self 
		should: [ grammar parse: 'a ' ] 
		raise: JEFailure 
		withExceptionDo: [ :failure | 
			self assert: failure position equals: 2.
			self
				assertCollection: failure expectedSymbols
				hasSameElements: {	(JENonterminal named: 'plus symbol'). 
										(JENonterminal named: 'star symbol')}	]
]

{ #category : #'tests - failure' }
JEAEGrammarForestTests >> testParseSimpleExp03 [
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
JEAEGrammarForestTests >> testParseSimpleExp04 [
	self 
		should: [ grammar parse: 'a++' ] 
		raise: JEFailure 
		withExceptionDo: [ :failure | 
			self assert: failure position equals: 3.
			self
				assertCollection: failure expectedSymbols
				hasSameElements: {	(JENonterminal named: 'T'). 
										(JENonterminal named: 'letter a symbol')}	]
]

{ #category : #tests }
JEAEGrammarForestTests >> testRighmostDerivationMultiplyExp [
	forest := grammar parse: 'a*a'.
	
	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1.
	self
		assertCollection:
			(grammar
				rulesAtAll:
					{('E' -> 1).
					('T' -> 2).
					('P' -> 1).
					('letter a symbol' -> 1).
					('star symbol' -> 1).
					('T' -> 1).
					('P' -> 1).
					('letter a symbol' -> 1).})
		equals: forest rightmostDerivation
]

{ #category : #tests }
JEAEGrammarForestTests >> testRightmostDerivationMixedExp [
	forest := grammar parse: 'a+a*a+a*a'.
	
	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1.
	self
		assertCollection:
			(grammar
				rulesAtAll:
					{('E' -> 2).
					('T' -> 2).
					('P' -> 1).
					('letter a symbol' -> 1).
					('star symbol' -> 1).
					('T' -> 1).
					('P' -> 1).
					('letter a symbol' -> 1).
					('plus symbol' -> 1).
					('E' -> 2).
					('T' -> 2).
					('P' -> 1).
					('letter a symbol' -> 1).
					('star symbol' -> 1).
					('T' -> 1).
					('P' -> 1).
					('letter a symbol' -> 1).
					('plus symbol' -> 1).
					('E' -> 1).
					('T' -> 1).
					('P' -> 1).
					('letter a symbol' -> 1).})
		equals: forest rightmostDerivation
]

{ #category : #tests }
JEAEGrammarForestTests >> testRightmostDerivationSimpleExp01 [
	forest := grammar parse: 'a'.

	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1.
	self
		assertCollection:
			(grammar
				rulesAtAll:
					{('E' -> 1).
					('T' -> 1).
					('P' -> 1).
					('letter a symbol' -> 1).})
		equals: forest rightmostDerivation
]
