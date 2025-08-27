"
a parse forest represents the syntactic structure (syntax tree) of a string according to a context free grammar.

syntaxForest is a Binary Shared Packed Parse Forest.
grammar is a Context Free Grammar.


"
Class {
	#name : 'JEParseForest',
	#superclass : 'Object',
	#instVars : [
		'grammar',
		'syntaxForest'
	],
	#category : 'EarleyParser-Core-Public',
	#package : 'EarleyParser-Core',
	#tag : 'Public'
}

{ #category : 'instance creation' }
JEParseForest class >> given: aBSPPForest of: aJEGrammar [
	"given a syntax forest of a grammar"

	^ self basicNew initializeSyntaxForest: aBSPPForest andGrammar: aJEGrammar
]

{ #category : 'initialization' }
JEParseForest >> initializeSyntaxForest: aBSPPForest andGrammar: aJEGrammar [
	syntaxForest := aBSPPForest.
	grammar := aJEGrammar
]

{ #category : 'testing' }
JEParseForest >> isAmbiguous [
	JEDepthFirstVisitor new
		preOrderNodeBlock: [ :packed |
			packed familiesSize > 1
				ifTrue: [ ^ true ] ];
		visit: syntaxForest.
	^ false
]

{ #category : 'accessing' }
JEParseForest >> leftmostDerivation [
	| derivation |
	derivation := SinglyLinkedList new.
	JEDepthFirstVisitor new
		preOrderFamilyBlock: [ :family |
			(family parent isNonterminal and: [ family parent isFinal ])
				ifTrue: [ derivation addLast: (grammar productionRuleAt: family parent rule) ] ];
		visit: syntaxForest.
	^ derivation asArray
]

{ #category : 'testing' }
JEParseForest >> numberOfTrees [
	^ syntaxForest numberOfTrees
]

{ #category : 'initialize-release' }
JEParseForest >> release [
	syntaxForest release.
	syntaxForest := nil.
	grammar := nil.
	super release
]

{ #category : 'accessing' }
JEParseForest >> rightmostDerivation [
	| derivation |
	derivation := SinglyLinkedList new.
	JEDepthFirstVisitor new
		postOrderFamilyBlock: [ :family |
			(family parent isNonterminal and: [ family parent isFinal ])
				ifTrue: [ derivation addFirst: (grammar productionRuleAt: family parent rule) ] ];
		visit: syntaxForest.
	^ derivation asArray
]
