"
a tree 

"
Class {
	#name : #ESTree,
	#superclass : #Object,
	#instVars : [
		'root'
	],
	#category : 'EarleySyntaxTree-Implementation'
}

{ #category : #'instance creation' }
ESTree class >> rootNode: aTreeNode [
	^ self basicNew initializeRoot: aTreeNode
]

{ #category : #visiting }
ESTree >> acceptVisitor: anESTreeVisitor [ 
	anESTreeVisitor visitNode: root 
]

{ #category : #converting }
ESTree >> asArrayRepresentation [
	"an array representation of myself. { node model. node children asArray }"

	| stack |
	stack := SinglyLinkedStack new.
	ESTDepthFirstVisitor new
		postOrderBlock: [ :node | 
			node children isEmpty
				ifTrue: [ stack push: {node model. #()} ]
				ifFalse: [ | newChildren |
					newChildren := SinglyLinkedStack new.
					node children size timesRepeat: [ newChildren push: stack pop ].
					stack push: {node model. newChildren asArray} ] ];
		visit: self.
	^ stack pop
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

{ #category : #accessing }
ESTree >> root [
	^ root model
]
