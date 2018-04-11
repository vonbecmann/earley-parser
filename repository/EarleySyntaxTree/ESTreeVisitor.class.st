"
a tree visitor.

preOrderBlock - an action that it is execute in pre-order for each tree node.
postOrderBlock - an action that it is execute in post-order for each tree node.

"
Class {
	#name : #ESTreeVisitor,
	#superclass : #Object,
	#instVars : [
		'postOrderBlock',
		'preOrderBlock'
	],
	#category : 'EarleySyntaxTree-Implementation'
}

{ #category : #initialization }
ESTreeVisitor >> postOrderBlock: aBlockWithOneArgument [
	postOrderBlock := aBlockWithOneArgument
]

{ #category : #initialization }
ESTreeVisitor >> preOrderBlock: aBlockWithOneArgument [
	preOrderBlock := aBlockWithOneArgument
]

{ #category : #visiting }
ESTreeVisitor >> visit: aGivenTree [
	aGivenTree acceptVisitor: self
]

{ #category : #visiting }
ESTreeVisitor >> visitNode: aGivenTreeNode [
	self subclassResponsibility
]
