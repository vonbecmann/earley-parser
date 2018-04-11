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
	ESTDepthFirstVisitor new 
		postOrderBlock: [ :node | 
			node model isTerminal
				ifTrue: [ stack push: node model reason ]
				ifFalse: 
					[ node children isEmpty
						ifTrue: [ stack push: #() ]
						ifFalse: 
							[ | newChildren |
								newChildren := SinglyLinkedStack new.
								node children size timesRepeat: [ newChildren push: stack pop ].
								stack push: newChildren asArray ] ] ];
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
	ESTDepthFirstVisitor new
		preOrderBlock: [ :node | 
			node model isNonterminal
				ifTrue: [ derivation addLast: node model reason ] ];
		visit: tree.
	^ derivation asArray
]

{ #category : #'initialize-release' }
ESParseTree >> release [
	tree := nil.
	grammar := nil.
	super release
]

{ #category : #accessing }
ESParseTree >> rightmostDerivation [
	| derivation |
	derivation := SinglyLinkedList new.
	ESTRightToLeftDepthFirstVisitor new
		preOrderBlock: [ :node | 
			node model isNonterminal
				ifTrue: [ derivation addLast: node model reason ] ];
		visit: tree.
	^ derivation asArray
]
