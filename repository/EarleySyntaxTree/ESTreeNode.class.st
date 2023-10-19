"
a node of the tree.

model - an object.
children - array of tree nodes.

"
Class {
	#name : #ESTreeNode,
	#superclass : #Object,
	#instVars : [
		'model',
		'children'
	],
	#category : #'EarleySyntaxTree-Implementation'
}

{ #category : #'instance creation' }
ESTreeNode class >> model: anObject [
	^ self basicNew initializeModel: anObject andChildren: #()
]

{ #category : #'instance creation' }
ESTreeNode class >> model: anObject children: aTreeNodeCollection [
	^ self basicNew initializeModel: anObject andChildren: aTreeNodeCollection
]

{ #category : #comparing }
ESTreeNode >> = anObject [
	^ self class == anObject class and: [ model = anObject model ]
]

{ #category : #visiting }
ESTreeNode >> acceptVisitor: anESTreeVisitor [
	anESTreeVisitor visitNode: self
]

{ #category : #accessing }
ESTreeNode >> children [
	^ children
]

{ #category : #comparing }
ESTreeNode >> hash [
	^ (self class hash + model hash) hashMultiply
]

{ #category : #initialization }
ESTreeNode >> initializeModel: anObject andChildren: aTreeNodeCollection [
	self initialize.
	model := anObject.
	children := aTreeNodeCollection
]

{ #category : #accessing }
ESTreeNode >> model [
	^ model
]

{ #category : #printing }
ESTreeNode >> printOn: aStream [
	aStream
		nextPut: $(;
		print: model;
		nextPut: $)
]

{ #category : #'initialize-release' }
ESTreeNode >> release [
	model := nil.
	children := nil.
	super release
]
