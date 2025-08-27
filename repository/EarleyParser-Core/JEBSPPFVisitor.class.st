"
Binary 
Shared 
Packed
Parse 
Forest 
Visitor.

"
Class {
	#name : 'JEBSPPFVisitor',
	#superclass : 'Object',
	#instVars : [
		'postOrderFamilyBlock',
		'postOrderNodeBlock',
		'preOrderFamilyBlock',
		'preOrderNodeBlock'
	],
	#category : 'EarleyParser-Core-BSPPForest',
	#package : 'EarleyParser-Core',
	#tag : 'BSPPForest'
}

{ #category : 'initialization' }
JEBSPPFVisitor >> postOrderFamilyBlock: aBlockWithOneArgument [
	postOrderFamilyBlock := aBlockWithOneArgument
]

{ #category : 'initialization' }
JEBSPPFVisitor >> postOrderNodeBlock: aBlockWithOneArgument [
	postOrderNodeBlock := aBlockWithOneArgument
]

{ #category : 'initialization' }
JEBSPPFVisitor >> preOrderFamilyBlock: aBlockWithOneArgument [
	preOrderFamilyBlock := aBlockWithOneArgument
]

{ #category : 'initialization' }
JEBSPPFVisitor >> preOrderNodeBlock: aBlockWithOneArgument [
	preOrderNodeBlock := aBlockWithOneArgument
]

{ #category : 'visiting' }
JEBSPPFVisitor >> visit: aBSPPForest [
	aBSPPForest acceptVisitor: self
]

{ #category : 'visiting' }
JEBSPPFVisitor >> visitNode: aPackedOrFamilyNode [
	self subclassResponsibility
]

{ #category : 'visiting' }
JEBSPPFVisitor >> visitPostOrderFamily: aFamily [
	"visit in post-order a family"

	postOrderFamilyBlock ifNotNil: [ postOrderFamilyBlock cull: aFamily ]
]

{ #category : 'visiting' }
JEBSPPFVisitor >> visitPostOrderPackedNode: aPackedNode [
	"visit in post-order a node"

	postOrderNodeBlock ifNotNil: [ postOrderNodeBlock cull: aPackedNode ]
]

{ #category : 'visiting' }
JEBSPPFVisitor >> visitPreOrderFamily: aFamily [
	"visit in pre-order a family"

	preOrderFamilyBlock ifNotNil: [ preOrderFamilyBlock cull: aFamily ]
]

{ #category : 'visiting' }
JEBSPPFVisitor >> visitPreOrderPackedNode: aPackedNode [
	"visit in pre-order a node"

	preOrderNodeBlock ifNotNil: [ preOrderNodeBlock cull: aPackedNode ]
]
