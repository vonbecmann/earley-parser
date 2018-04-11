Class {
	#name : #ESTreeTest,
	#superclass : #TestCase,
	#category : 'EarleySyntaxTree-Tests-Implementation'
}

{ #category : #tests }
ESTreeTest >> testAsString [
	| tree |
	tree := ESTree rootNode: (ESTreeNode model: 'A').
	self assert: tree asString equals: 'ESTree((''A''))'
]
