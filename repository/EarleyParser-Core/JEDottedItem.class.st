"
an Earley item or state 

 [ dotted rule @  start ].
 [ dotted rule @  [ start, end ] ].

start: where the recognition of the dotted rule started.
end: the item set that contains this item or nil. but an item always belongs to an item set.

- an item with the dot at the beginning (just after the arrow) is known as a predicted item, since it results from a prediction.
- an item with the dot at the end is called a final (reduce) item, since the dot at the end means that the whole right-hand side has been recognized and can be reduced.
- an item with the dot in front of a non-terminal is call it a prediction item, since it gives rise to predictions.

- node : a packed parse node of myself, only used during parsing that's why it is lazy initialized.


"
Class {
	#name : #JEDottedItem,
	#superclass : #JEItem,
	#instVars : [
		'dottedRule'
	],
	#category : #'EarleyParser-Core-Implementation'
}

{ #category : #'instance creation' }
JEDottedItem class >> given: aDottedRule startedAt: column [
	"an item for the given dotted rule that started its recognition at the given column"

	^ self basicNew initializeDottedRule: aDottedRule start: column
]

{ #category : #'instance creation' }
JEDottedItem class >> given: aDottedRule startedAt: firstColumn andEndedAt: secondColumn [
	"an item for the given dotted rule that started its recognition at the given columns"

	^ (self given: aDottedRule startedAt: firstColumn)
		end: secondColumn;
		yourself
]

{ #category : #comparing }
JEDottedItem >> = anItem [
	self == anItem
		ifTrue: [ ^ true ].
	self class == anItem class
		ifFalse: [ ^ false ].
	start = anItem start
		ifFalse: [ ^ false ].
	dottedRule = anItem dottedRule
		ifFalse: [ ^ false ].
	end = anItem end
		ifFalse: [ ^ false ].
	^ true
]

{ #category : #parsing }
JEDottedItem >> addFamilyWith: completeItem to: parentItem [
	self isPredicted
		ifTrue: [ parentItem addFamilyWith: completeItem ]
		ifFalse: [ parentItem addFamilyWith: self and: completeItem ]
]

{ #category : #accessing }
JEDottedItem >> dottedRule [
	^ dottedRule
]

{ #category : #comparing }
JEDottedItem >> equals: anItem [
	^ (super equals: anItem) and: [ dottedRule = anItem dottedRule ]
]

{ #category : #enumerating }
JEDottedItem >> finalItemsWithHeadIsSymbolAtDotDo: aBlock [
	(end finalItemsWithHeadIs: dottedRule symbolAtDot) do: aBlock
]

{ #category : #accessing }
JEDottedItem >> firstKey [ 
	^ dottedRule 
]

{ #category : #comparing }
JEDottedItem >> hash [
	^ ((dottedRule hash + start hash) hashMultiply + end hash) hashMultiply
]

{ #category : #accessing }
JEDottedItem >> head [
	^ dottedRule head
	
]

{ #category : #initialization }
JEDottedItem >> initializeDottedRule: aRule start: column [
	dottedRule := aRule.
	start := column.
	self initializeFamilies.
	self isEpsilon
		ifTrue: [ self addEmptyFamily ]
]

{ #category : #testing }
JEDottedItem >> isActive [
	^ dottedRule isActive
]

{ #category : #testing }
JEDottedItem >> isEpsilon [
	^ dottedRule isEpsilon
]

{ #category : #testing }
JEDottedItem >> isFinal [
	^ dottedRule isFinal
]

{ #category : #testing }
JEDottedItem >> isNonterminal [
	^ true
]

{ #category : #testing }
JEDottedItem >> isPredicted [
	^ dottedRule isPredicted
]

{ #category : #testing }
JEDottedItem >> isRepresentation [
	^ dottedRule isRepresentation
]

{ #category : #testing }
JEDottedItem >> isTerminal [
	^ false
]

{ #category : #accessing }
JEDottedItem >> moveDotForward [
	^ self class given: dottedRule moveDotForward startedAt: start
]

{ #category : #accessing }
JEDottedItem >> predictionItemsWithSymbolAtDotIsHead [
	^ start predictionItemsWithSymbolAtDotIs: dottedRule head
]

{ #category : #enumerating }
JEDottedItem >> predictionItemsWithSymbolAtDotIsHeadDo: aBlock [
	(start predictionItemsWithSymbolAtDotIs: dottedRule head) do: aBlock
]

{ #category : #printing }
JEDottedItem >> printOn: aStream [
	"[ dotted rule @ start ]"

	"[ dotted rule @  [ start, end ] ]"

	aStream nextPut: $[.
	dottedRule printOn: aStream.
	aStream nextPutAll: ' @ '.
	self printIntervalOn: aStream.
	aStream nextPut: $]
]

{ #category : #'initialize-release' }
JEDottedItem >> release [
	dottedRule := nil.
	super release
]

{ #category : #accessing }
JEDottedItem >> rule [
	^ dottedRule rule
]

{ #category : #accessing }
JEDottedItem >> secondKey [
	^ start
]

{ #category : #accessing }
JEDottedItem >> symbolAtDot [
	^ dottedRule symbolAtDot
]
