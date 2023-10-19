"
a tree 

"
Class {
	#name : #ESTree,
	#superclass : #Object,
	#instVars : [
		'root'
	],
	#category : #'EarleySyntaxTree-Implementation'
}

{ #category : #'instance creation' }
ESTree class >> rootNode: aTreeNode [
	^ self basicNew initializeRoot: aTreeNode
]

{ #category : #visiting }
ESTree >> acceptVisitor: anESTreeVisitor [
	anESTreeVisitor visitNode: root
]

{ #category : #initialization }
ESTree >> initializeRoot: aTreeNode [
	self initialize.
	root := aTreeNode
]

{ #category : #printing }
ESTree >> printOn: aStream [
	aStream
		print: self class;
		nextPut: $(;
		print: root;
		nextPut: $)
]

{ #category : #'initialize-release' }
ESTree >> release [
	root := nil.
	super release
]
