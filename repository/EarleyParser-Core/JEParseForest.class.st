"
a parse forest represents the syntactic structure (syntax tree) of a string according to a context free grammar.

syntaxTree is a Binary Shared Packed Parse Forest.
grammar is a Context Free Grammar.


"
Class {
	#name : #JEParseForest,
	#superclass : #Object,
	#instVars : [
		'syntaxTree',
		'grammar'
	],
	#category : 'EarleyParser-Core-Public'
}

{ #category : #'instance creation' }
JEParseForest class >> given: aSyntaxTree of: aJEGrammar [
	"given a syntax tree of a grammar"

	^ self basicNew initializeSyntaxTree: aSyntaxTree andGrammar: aJEGrammar
]

{ #category : #initialization }
JEParseForest >> initializeSyntaxTree: aSyntaxTree andGrammar: aJEGrammar [
	self initialize.
	syntaxTree := aSyntaxTree.
	grammar := aJEGrammar
]

{ #category : #testing }
JEParseForest >> isAmbiguous [
	^ syntaxTree isAmbiguous
]

{ #category : #accessing }
JEParseForest >> leftmostDerivation [
	| derivation |
	derivation := SinglyLinkedList new.
	JEDepthFirstVisitor new
		preOrderFamilyBlock: [ :family | 
			(family parent model isNonterminal and: [ family parent model isFinal ])
				ifTrue: [ derivation addLast: (grammar productionRuleAt: family parent model rule) ] ];
		visit: syntaxTree.
	^ derivation asArray
]

{ #category : #testing }
JEParseForest >> numberOfTrees [
	^ syntaxTree numberOfTrees
]

{ #category : #'initialize-release' }
JEParseForest >> release [
	syntaxTree release.
	syntaxTree := nil.
	grammar := nil.
	super release
]

{ #category : #accessing }
JEParseForest >> rightmostDerivation [
	| derivation |
	derivation := SinglyLinkedList new.
	JEDepthFirstVisitor new
		postOrderFamilyBlock: [ :family | 
			(family parent model isNonterminal and: [ family parent model isFinal ])
				ifTrue: [ derivation addFirst: (grammar productionRuleAt: family parent model rule) ] ];
		visit: syntaxTree.
	^ derivation asArray
]
