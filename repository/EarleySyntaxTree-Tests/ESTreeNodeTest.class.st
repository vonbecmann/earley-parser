Class {
	#name : #ESTreeNodeTest,
	#superclass : #TestCase,
	#category : 'EarleySyntaxTree-Tests-Implementation'
}

{ #category : #tests }
ESTreeNodeTest >> testAsString [
	self assert: (ESTreeNode model: 'A') asString equals: '(''A'')'
]

{ #category : #tests }
ESTreeNodeTest >> testChildrenIsEmpty [
	self assert: (ESTreeNode model: 'A') children isEmpty
]

{ #category : #tests }
ESTreeNodeTest >> testEqual01 [
	| one another |
	one := ESTreeNode model: 'A'.
	another := ESTreeNode model: 'A'.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self deny: one == another
]
