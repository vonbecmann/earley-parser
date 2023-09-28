"
Binary 
Shared 
Packed
Parse 
Forest 

"
Class {
	#name : #JEBSPPForest,
	#superclass : #Object,
	#instVars : [
		'root'
	],
	#category : #'EarleyParser-Core-BSPPForest'
}

{ #category : #'instance creation' }
JEBSPPForest class >> root: aPackedNode [
	^ self basicNew initializeRoot: aPackedNode
]

{ #category : #visiting }
JEBSPPForest >> acceptVisitor: aVisitor [
	aVisitor visitNode: root
]

{ #category : #initialization }
JEBSPPForest >> initializeRoot: aPackedNode [
	root := aPackedNode
]

{ #category : #testing }
JEBSPPForest >> numberOfTrees [
	"depth visit from the root node. return the number of trees from the root node"

	| numberOfTrees |
	numberOfTrees := IdentityDictionary new.
	JEDepthFirstVisitor new
		postOrderNodeBlock: [ :packed |
			packed children isEmpty
				ifTrue: [ numberOfTrees at: packed put: 1 ]
				ifFalse: [
					numberOfTrees
						at: packed
						ifAbsentPut:	[ packed children inject: 0 into: [ :sum :family | sum + (numberOfTrees at: family) ] ] ] ];
		postOrderFamilyBlock: [ :family |
			numberOfTrees
				at: family
				ifAbsentPut: [ family children inject: 1 into: [ :product :node | product * (numberOfTrees at: node) ] ] ];
		visit: self.
	^ numberOfTrees at: root
]

{ #category : #printing }
JEBSPPForest >> printOn: aStream [
	aStream
		print: self class;
		nextPut: $(;
		print: root;
		nextPut: $)
]

{ #category : #'initialize-release' }
JEBSPPForest >> release [
	root release.
	root := nil.
	super release
]
