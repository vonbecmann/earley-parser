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
	#category : 'EarleyParser-Core-Parsing'
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
JEPackedNode >> initialize [
	super initialize.
	families := #().
	familiesByKey := IdentityDictionary new
]

{ #category : #initialization }
JEPackedNode >> initializeModel: anItem [
	self initialize.
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
