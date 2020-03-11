"
a packed parse node.

model - 
	one of the following 
		- a dotted item or 
		- a terminal item 

families - a set of families. a family is unique, it cannot be duplicated.

each family represents a derivation of the parse node.
and the members (of a family) represents the sequence of items that constitute  a derivation.


"
Class {
	#name : #JEPackedNode,
	#superclass : #Object,
	#instVars : [
		'model',
		'families',
		'familiesByKey'
	],
	#category : #'EarleyParser-Core-BSPPForest'
}

{ #category : #'instance creation' }
JEPackedNode class >> model: anItem [
	^ self basicNew initializeModel: anItem
]

{ #category : #comparing }
JEPackedNode >> = anObject [
	^ self class == anObject class and: [ model = anObject model ]
]

{ #category : #visiting }
JEPackedNode >> acceptPostOrderVisitor: aVisitor [
	aVisitor visitPostOrderPackedNode: self
]

{ #category : #visiting }
JEPackedNode >> acceptPreOrderVisitor: aVisitor [
	aVisitor visitPreOrderPackedNode: self
]

{ #category : #visiting }
JEPackedNode >> acceptVisitor: aVisitor [
	aVisitor visitNode: self
]

{ #category : #accessing }
JEPackedNode >> addFamily: aFamily [
	familiesByKey
		jeAt: aFamily first
		at: aFamily second
		ifAbsentPut: 
			[ 	aFamily parent: self.
				families := families copyWith: aFamily.
				true ]
]

{ #category : #accessing }
JEPackedNode >> addFamilyWith: aPackedNode [
	familiesByKey
		jeAt: aPackedNode
		at: nil
		ifAbsentPut: [ 
			families := families copyWith: (JEFamily parent: self first: aPackedNode).
			true ]
]

{ #category : #accessing }
JEPackedNode >> addFamilyWith: firstPackedNode and: secondPackedNode [
	familiesByKey
		jeAt: firstPackedNode
		at: secondPackedNode
		ifAbsentPut: [ 
			families := families
				copyWith:
					(JEFamily parent: self first: firstPackedNode second: secondPackedNode).
			true ]
]

{ #category : #visiting }
JEPackedNode >> children [
	^ families 
]

{ #category : #accessing }
JEPackedNode >> families [
	^ families
]

{ #category : #accessing }
JEPackedNode >> familiesSize [
	^ families size
]

{ #category : #comparing }
JEPackedNode >> hash [
	^ (self class hash + model hash) hashMultiply
]

{ #category : #initialization }
JEPackedNode >> initializeModel: anItem [
	families := #().
	familiesByKey := IdentityDictionary new.
	model := anItem
]

{ #category : #accessing }
JEPackedNode >> model [
	^ model
]

{ #category : #printing }
JEPackedNode >> printOn: aStream [
	aStream
		nextPut: $(;
		print: model;
		nextPut: $)
]

{ #category : #'initialize-release' }
JEPackedNode >> release [
	model := nil.
	families
		ifNotNil: 
			[	families do: [ :family | family release ].
				families := nil ].
	familiesByKey := nil.
	super release
]
