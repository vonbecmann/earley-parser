"
a family of packed parse nodes.

children 
 	an empty family(useful when you have epsilon rules),
	a family with one child,
	a family with two children.
	
children are unique and they are checked by identity.

children represent  the sequence of items that constitute  a derivation.


	

"
Class {
	#name : #JEFamily,
	#superclass : #Object,
	#instVars : [
		'parent',
		'first',
		'second',
		'children'
	],
	#category : #'EarleyParser-Core-Parsing'
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
				and: [ first == anObject first 
					and: [ second == anObject second ] ] ]
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
	^ first
]

{ #category : #comparing }
JEFamily >> hash [
	| hash |
	hash := (self class hash + parent identityHash) hashMultiply.
	first
		ifNotNil: 
			[	hash := (hash + first identityHash) hashMultiply.
				second ifNotNil: [ hash := (hash + second identityHash) hashMultiply ] ].
	^ hash
]

{ #category : #initialization }
JEFamily >> initializeFirst: firstPackedNode andSecond: secondPackedNode [
	first := firstPackedNode.
	second := secondPackedNode.
	children := first
		ifNil: [ #() ]
		ifNotNil: [ 
			second
				ifNil: [ {first} ]
				ifNotNil: [ {first. second} ] ]
]

{ #category : #testing }
JEFamily >> isEmpty [
	^ first isNil and: [ second isNil ]
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
	first
		ifNotNil: [ 
			aStream print: first.
			second
				ifNotNil: [ 
					aStream
						nextPutAll: ', ';
						print: second ] ].
	aStream nextPut: $)
]

{ #category : #'initialize-release' }
JEFamily >> release [
	parent := nil.
	first := nil.
	second := nil.
	children := nil.
	super release
]

{ #category : #accessing }
JEFamily >> second [
	^ second 
	
]

{ #category : #accessing }
JEFamily >> size [
	^ children size
]
