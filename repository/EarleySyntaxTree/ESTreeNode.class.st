"
a node of the tree.

model - an object.
children - a tree node array.

"
Class {
	#name : #ESTreeNode,
	#superclass : #Object,
	#instVars : [
		'model',
		'children'
	],
	#category : 'EarleySyntaxTree-Implementation'
}

{ #category : #'instance creation' }
ESTreeNode class >> model: anObject [ 
	^ self basicNew initializeModel: anObject
]

{ #category : #comparing }
ESTreeNode >> = anObject [
	^ self class == anObject class and: [ model = anObject model ]
]

{ #category : #accessing }
ESTreeNode >> children [
	^ children
]

{ #category : #accessing }
ESTreeNode >> children: treeNodeArray [
	children := treeNodeArray
]

{ #category : #comparing }
ESTreeNode >> hash [
	^ (self class hash + model hash) hashMultiply
]

{ #category : #initialization }
ESTreeNode >> initialize [
	super initialize.
	children := Array empty
]

{ #category : #initialization }
ESTreeNode >> initializeModel: anObject [
	self initialize.
	model := anObject
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
