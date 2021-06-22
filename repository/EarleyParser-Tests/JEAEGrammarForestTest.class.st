Class {
	#name : #JEAEGrammarForestTest,
	#superclass : #JEParseGrammarTest,
	#category : #'EarleyParser-Tests-Parsing'
}

{ #category : #running }
JEAEGrammarForestTest >> setUp [
	super setUp.
	grammar := JEExemplar AE
]

{ #category : #tests }
JEAEGrammarForestTest >> testLeftmostDerivationMixedExp [
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
JEAEGrammarForestTest >> testLeftmostDerivationMultiplyExp [
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
JEAEGrammarForestTest >> testLeftmostDerivationPlusExp [
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
JEAEGrammarForestTest >> testParseMixedExp [
	forest := grammar parse: 'a+a*a+a*a'.

	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1
]

{ #category : #tests }
JEAEGrammarForestTest >> testParseMultiplyExp [
	forest := grammar parse: 'a*a'.

	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1
]

{ #category : #tests }
JEAEGrammarForestTest >> testParsePlusExp [
	forest := grammar parse: 'a+a'.
	
	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1
]

{ #category : #tests }
JEAEGrammarForestTest >> testParseSimpleExp01 [
	forest := grammar parse: 'a'.

	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1
]

{ #category : #'tests - failure' }
JEAEGrammarForestTest >> testParseSimpleExp02 [
	self 
		should: [ grammar parse: 'a ' ] 
		raise: JEFailure 
		withExceptionDo: [ :failure | 
			self deny: failure wasAtEnd.
			self assert: failure position equals: 2.
			self assert: failure actual equals: Character space.
			self
				assertCollection: failure expectedSymbols
				hasSameElements: {	(NCNonterminal named: 'plus symbol'). 
										(NCNonterminal named: 'star symbol')}	]
]

{ #category : #'tests - failure' }
JEAEGrammarForestTest >> testParseSimpleExp03 [
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
JEAEGrammarForestTest >> testParseSimpleExp04 [
	self 
		should: [ grammar parse: 'a++' ] 
		raise: JEFailure 
		withExceptionDo: [ :failure | 
			self deny: failure wasAtEnd.			
			self assert: failure position equals: 3.
			self assert: failure actual equals: $+.
			self
				assertCollection: failure expectedSymbols
				hasSameElements: {	(NCNonterminal named: 'T'). 
										(NCNonterminal named: 'letter a symbol')}	]
]

{ #category : #tests }
JEAEGrammarForestTest >> testRighmostDerivationMultiplyExp [
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
JEAEGrammarForestTest >> testRightmostDerivationMixedExp [
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
JEAEGrammarForestTest >> testRightmostDerivationSimpleExp01 [
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
