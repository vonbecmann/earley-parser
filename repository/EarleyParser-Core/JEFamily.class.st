"
a family of packed parse nodes.

members 
 	an empty family(useful when you have epsilon rules),
	a family with one member,
	a family with two members.
	
members are unique and they are checked by identity.

members represent  the sequence of items that constitute  a derivation.


	

"
Class {
	#name : #JEFamily,
	#superclass : #Object,
	#instVars : [
		'parent',
		'children',
		'members'
	],
	#category : #'EarleyParser-Core-BSPPForest'
}

{ #category : #'instance creation' }
JEFamily class >> empty [
	^ self basicNew initializeFirst: nil andSecond: nil
]

{ #category : #'instance creation' }
JEFamily class >> with: aPackedNode [
	^ self basicNew initializeFirst: aPackedNode andSecond: nil
]

{ #category : #'instance creation' }
JEFamily class >> with: firstPackedNode with: secondPackedNode [
	^ self basicNew initializeFirst: firstPackedNode andSecond: secondPackedNode
]

{ #category : #comparing }
JEFamily >> = anObject [
	^ self class == anObject class
		and: [ parent == anObject parent
				and: [ self first == anObject first 
					and: [ self second == anObject second ] ] ]
]

{ #category : #visiting }
JEFamily >> acceptPostOrderVisitor: aVisitor [
	aVisitor visitPostOrderFamily: self
]

{ #category : #visiting }
JEFamily >> acceptPreOrderVisitor: aVisitor [
	aVisitor visitPreOrderFamily: self
]

{ #category : #visiting }
JEFamily >> acceptVisitor: aVisitor [
	aVisitor visitNode: self
]

{ #category : #visiting }
JEFamily >> children [
	^ children
]

{ #category : #accessing }
JEFamily >> first [
	^ members first
]

{ #category : #comparing }
JEFamily >> hash [
	| hash |
	hash := (self class hash + parent identityHash) hashMultiply.
	self first
		ifNotNil: 
			[	hash := (hash + self first identityHash) hashMultiply.
				self second ifNotNil: [ hash := (hash + self second identityHash) hashMultiply ] ].
	^ hash
]

{ #category : #initialization }
JEFamily >> initializeFirst: firstPackedNode andSecond: secondPackedNode [
	members := {firstPackedNode. secondPackedNode}.
	children := members reject: [ :each | each isNil ]
]

{ #category : #testing }
JEFamily >> isEmpty [
	^ children isEmpty
]

{ #category : #accessing }
JEFamily >> parent [
	^ parent
]

{ #category : #initialization }
JEFamily >> parent: aPackedNode [
	parent := aPackedNode
]

{ #category : #printing }
JEFamily >> printOn: aStream [
	aStream nextPut: $(.
	children
		do: [ :each | aStream print: each ]
		separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPut: $)
]

{ #category : #'initialize-release' }
JEFamily >> release [
	parent := nil.
	children := nil.
	members := nil.
	super release
]

{ #category : #accessing }
JEFamily >> second [
	^ members second 
	
]

{ #category : #accessing }
JEFamily >> size [
	^ children size
]
