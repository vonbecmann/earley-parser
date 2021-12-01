"
an Earley item or state. like a LR(0) item. 

start: the column where the recognition started.
end: the column that contains this item or nil. but an item always belongs to a column.

firstKey :
secondKey:  a composed key useful to know if this item already exists in a column.

Also a packed parse node of myself, only used during parsing.

a packed parse node.

families - a set of families. a family is unique, it cannot be duplicated.

each family represents a derivation of the parse node.
and the members (of a family) represents the sequence of items that constitute  a derivation.






"
Class {
	#name : #JEItem,
	#superclass : #Object,
	#instVars : [
		'start',
		'end'
	],
	#category : #'EarleyParser-Core-Implementation'
}

{ #category : #visiting }
JEItem >> acceptPostOrderVisitor: aVisitor [
	aVisitor visitPostOrderPackedNode: self
]

{ #category : #visiting }
JEItem >> acceptPreOrderVisitor: aVisitor [
	aVisitor visitPreOrderPackedNode: self
]

{ #category : #visiting }
JEItem >> acceptVisitor: aVisitor [
	aVisitor visitNode: self
]

{ #category : #visiting }
JEItem >> children [
	^ self families 
]

{ #category : #accessing }
JEItem >> end [
	"the column that contains this item or nil"

	^ end
]

{ #category : #accessing }
JEItem >> end: column [
	"the column that contains this item"

	end := column
]

{ #category : #comparing }
JEItem >> equals: anItem [
	^ self class == anItem class and: [ start = anItem start ]
]

{ #category : #accessing }
JEItem >> families [
	^ self subclassResponsibility
]

{ #category : #accessing }
JEItem >> familiesSize [
	^ self subclassResponsibility
]

{ #category : #accessing }
JEItem >> firstKey [
	self subclassResponsibility
]

{ #category : #testing }
JEItem >> isActive [
	^ self subclassResponsibility
]

{ #category : #testing }
JEItem >> isFinal [
	^ self subclassResponsibility
]

{ #category : #testing }
JEItem >> isNonterminal [
	^ self subclassResponsibility
]

{ #category : #testing }
JEItem >> isPredicted [
	^ self subclassResponsibility
]

{ #category : #testing }
JEItem >> isRepresentation [
	^ self subclassResponsibility
]

{ #category : #testing }
JEItem >> isTerminal [
	^ self subclassResponsibility
]

{ #category : #printing }
JEItem >> printIntervalOn: aStream [
	end
		ifNil: [ 	start shortPrintOn: aStream ]
		ifNotNil: [ 
			aStream nextPut: $[.
			start shortPrintOn: aStream.
			aStream nextPutAll: ', '.
			end shortPrintOn: aStream.
			aStream nextPut: $] ]
]

{ #category : #'initialize-release' }
JEItem >> release [
	start := nil.
	end := nil.
	super release
]

{ #category : #accessing }
JEItem >> secondKey [
	self subclassResponsibility
]

{ #category : #accessing }
JEItem >> start [
	^ start
]
