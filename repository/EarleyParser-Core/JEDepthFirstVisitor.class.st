"
left to right 
depth first visitor 
of 
a binary shared packed parse forest.


"
Class {
	#name : #JEDepthFirstVisitor,
	#superclass : #Object,
	#instVars : [
		'postOrderFamilyBlock',
		'preOrderFamilyBlock',
		'postOrderNodeBlock',
		'preOrderNodeBlock'
	],
	#category : 'EarleyParser-Core-Parsing'
}

{ #category : #initialization }
JEDepthFirstVisitor >> postOrderFamilyBlock: aBlockWithOneArgument [
	postOrderFamilyBlock := aBlockWithOneArgument
]

{ #category : #initialization }
JEDepthFirstVisitor >> postOrderNodeBlock: aBlockWithOneArgument [
	postOrderNodeBlock := aBlockWithOneArgument
]

{ #category : #initialization }
JEDepthFirstVisitor >> preOrderFamilyBlock: aBlockWithOneArgument [
	preOrderFamilyBlock := aBlockWithOneArgument
]

{ #category : #initialization }
JEDepthFirstVisitor >> preOrderNodeBlock: aBlockWithOneArgument [
	preOrderNodeBlock := aBlockWithOneArgument
]

{ #category : #visiting }
JEDepthFirstVisitor >> visit: aBSPPForest [
	aBSPPForest acceptVisitor: self
]

{ #category : #visiting }
JEDepthFirstVisitor >> visitNode: aPackedOrFamilyNode [
	" status: notvisited -> visited -> done"

	| visitStack visited |
	visitStack := SinglyLinkedStack with: aPackedOrFamilyNode.
	visited := IdentityDictionary new.
	[ visitStack isEmpty ]
		whileFalse: [ | element status |
			element := visitStack top.
			status := visited at: element ifAbsent: #notvisited.
			status == #notvisited
				ifTrue: [ 
					visited at: element put: #visited.
					element acceptPreOrderVisitor: self.
					element children reverseDo: [ :child | visitStack push: child ] ]
				ifFalse: [ 
					status == #visited
						ifTrue: [ 
							visitStack pop.
							element acceptPostOrderVisitor: self.
							visited at: element put: #done ]
						ifFalse: [ 
							status == #done
								ifTrue: [ visitStack pop ] ] ] ]
]

{ #category : #visiting }
JEDepthFirstVisitor >> visitPostOrderFamily: aFamily [
	"visit in post-order a family"

	postOrderFamilyBlock ifNotNil: [ postOrderFamilyBlock cull: aFamily ]
]

{ #category : #visiting }
JEDepthFirstVisitor >> visitPostOrderPackedNode: aPackedNode [
	"visit in post-order a node"

	postOrderNodeBlock ifNotNil: [ postOrderNodeBlock cull: aPackedNode ]
]

{ #category : #visiting }
JEDepthFirstVisitor >> visitPreOrderFamily: aFamily [
	"visit in pre-order a family"

	preOrderFamilyBlock ifNotNil: [ preOrderFamilyBlock cull: aFamily ]
]

{ #category : #visiting }
JEDepthFirstVisitor >> visitPreOrderPackedNode: aPackedNode [
	"visit in pre-order a node"

	preOrderNodeBlock ifNotNil: [ preOrderNodeBlock cull: aPackedNode ]
]
