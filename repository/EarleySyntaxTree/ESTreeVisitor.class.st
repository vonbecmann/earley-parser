"
a tree visitor.

preOrderBlock - an action that it is execute in pre-order for each tree node.
postOrderBlock - an action that it is execute in post-order for each tree node.

see class side for specific visitors.

"
Class {
	#name : #ESTreeVisitor,
	#superclass : #Object,
	#instVars : [
		'postOrderBlock',
		'preOrderBlock'
	],
	#category : #'EarleySyntaxTree-Public'
}

{ #category : #visitors }
ESTreeVisitor class >> depthFirst [
	^ ESTDepthFirstVisitor
]

{ #category : #visitors }
ESTreeVisitor class >> rightToLeftDepthFirst [
	^ ESTRightToLeftDepthFirstVisitor
]

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
