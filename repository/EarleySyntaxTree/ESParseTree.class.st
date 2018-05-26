"
a concrete syntax parse tree.

rooted tree that represents the syntactic structure of a string according to some context-free grammar.
"
Class {
	#name : #ESParseTree,
	#superclass : #Object,
	#instVars : [
		'tree',
		'grammar'
	],
	#category : 'EarleySyntaxTree-Public'
}

{ #category : #'instance creation' }
ESParseTree class >> given: aTree of: aJEGrammar [
	"given a syntax tree of a grammar"

	^ self basicNew initializeTree: aTree andGrammar: aJEGrammar
]

{ #category : #visiting }
ESParseTree >> acceptVisitor: anESTreeVisitor [ 
	tree acceptVisitor: anESTreeVisitor 
]

{ #category : #converting }
ESParseTree >> asArrayRepresentation [
	"an array representation of myself."

	| stack |
	stack := SinglyLinkedStack new.
	ESTreeVisitor depthFirst new
		postOrderBlock: [ :node | 
			stack
				push:
					(node model isTerminal
						ifTrue: [ node model reason ]
						ifFalse: [ 
							node children isEmpty
								ifTrue: [ #() ]
								ifFalse: [ stack popReversed: node children size ] ]) ];
		visit: tree.
	^ stack pop
]

{ #category : #initialization }
ESParseTree >> initializeTree: aTree andGrammar: aJEGrammar [
	self initialize.
	tree := aTree.
	grammar := aJEGrammar
]

{ #category : #accessing }
ESParseTree >> leftmostDerivation [
	| derivation |
	derivation := SinglyLinkedList new.
	ESTreeVisitor depthFirst new
		preOrderBlock: [ :node | 
			node model isNonterminal
				ifTrue: [ derivation addLast: node model reason ] ];
		visit: tree.
	^ derivation asArray
]

{ #category : #'initialize-release' }
ESParseTree >> release [
	tree release.
	tree := nil.
	grammar := nil.
	super release
]

{ #category : #accessing }
ESParseTree >> rightmostDerivation [
	| derivation |
	derivation := SinglyLinkedList new.
	ESTreeVisitor rightToLeftDepthFirst new
		preOrderBlock: [ :node | 
			node model isNonterminal
				ifTrue: [ derivation addLast: node model reason ] ];
		visit: tree.
	^ derivation asArray
]
