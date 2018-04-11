"
a column of items at the given position in the chart.

acts as a set of items.

Nonterminals are unique, that's why they are use as a key in the dictionaries.

number - a position in the chart.

items - a queue of items to be processed in order.

predictionItemsByNonterminal - items with the symbol at dot is a nonterminal, so they are involve in the prediction of new items. 

finalItemsByNonterminal - items with the dot at the end, that were completed in this column, so they are needed in the completion during the prediction of a nonterminal. It is used when you have epsilon rules.

itemsByKey - items by key. useful for testing if a item already exists.




"
Class {
	#name : #JEColumn,
	#superclass : #Object,
	#instVars : [
		'number',
		'items',
		'predictionItemsByNonterminal',
		'finalItemsByNonterminal',
		'itemsByKey'
	],
	#category : 'EarleyParser-Core-Implementation'
}

{ #category : #'instance creation' }
JEColumn class >> number: anInteger [ 
	^ self basicNew initializeNumber: anInteger
]

{ #category : #comparing }
JEColumn >> <= column [ 
	^ number <= column number
]

{ #category : #comparing }
JEColumn >> = column [
	self == column
		ifTrue: [ ^ true ].
	^ self class == column class and: [ number == column number ]
]

{ #category : #accessing }
JEColumn >> activeItems [
	^ Array
		streamContents: [ :s | 
			itemsByKey
				associationsDo:
					[ :assoc | 
						assoc value 
							select: [ :each | each isActive ] 
							thenDo: [ :each | s nextPut: each ] ] ]
]

{ #category : #adding }
JEColumn >> add: anItem [
	" Optimize for efficiency. 
		if the item doesn't exist then add it last.
		this is a predicted item "

	(itemsByKey at: anItem firstKey ifAbsent: nil)
		ifNil: [ self basicAdd: anItem ]
		ifNotNil:
			[ :dict | 
				(dict at: anItem secondKey ifAbsent: nil) 
					ifNil: [ self basicAdd: anItem ] ]
]

{ #category : #parsing }
JEColumn >> addTerminalItem: terminalItem [
	" add a scanned terminal while parsing "

	(itemsByKey at: terminalItem firstKey ifAbsent: nil)
		ifNotNil: 
			[ :dict | 
				(dict at: terminalItem secondKey ifAbsent: nil) 
					ifNotNil: [ :found | ^ found ] ].
	self itemsByKeyPut: terminalItem.
	^ terminalItem
		end: self;
		yourself
]

{ #category : #private }
JEColumn >> basicAdd: anItem [
	self itemsByKeyPut: anItem.
	anItem isFinal
		ifTrue: [ 
			anItem start = self
				ifTrue: [ self finalItemsByNonterminalAt: anItem head put: anItem ] ]
		ifFalse: [ 
			anItem symbolAtDot isNonterminal 
				ifTrue: [ self predictionItemsByNonterminalAt: anItem symbolAtDot put: anItem ] ].
	items nextPut: anItem.
	^ anItem
		end: self;
		yourself
]

{ #category : #private }
JEColumn >> finalItemsByNonterminalAt: nonterminal put: anItem [
	(finalItemsByNonterminal at: nonterminal ifAbsent: nil)
		ifNil: [ 
			finalItemsByNonterminal
				at: nonterminal
				put:
					(SinglyLinkedList new
						addLast: anItem;
						yourself) ]
		ifNotNil: [ :list | list addLast: anItem ]
]

{ #category : #accessing }
JEColumn >> finalItemsWithHeadIs: aNonterminal [
	^ finalItemsByNonterminal at: aNonterminal ifAbsent: #()
]

{ #category : #comparing }
JEColumn >> hash [
	^ number hash
]

{ #category : #testing }
JEColumn >> includes: anItem [
	"Answer whether an Item is present.
	Optimize for efficiency.
	itemsByKey anySatisfy: [ :each | each equals: anItem ]."

	(itemsByKey at: anItem firstKey ifAbsent: nil)
		ifNotNil:
			[ :dict | 
				(dict at: anItem secondKey ifAbsent: nil) 
					ifNotNil: [ :found | ^ found equals: anItem ] ].
	^ false
]

{ #category : #initialization }
JEColumn >> initialize [
	super initialize.
	items := SinglyLinkedQueue new.
	predictionItemsByNonterminal := IdentityDictionary new.
	finalItemsByNonterminal := IdentityDictionary new.
	itemsByKey := IdentityDictionary new
]

{ #category : #initialization }
JEColumn >> initializeNumber: anInteger [
	self initialize.
	number := anInteger
]

{ #category : #testing }
JEColumn >> isEmpty [
	^ itemsByKey isEmpty
]

{ #category : #private }
JEColumn >> itemsByKeyPut: anItem [
	(itemsByKey at: anItem firstKey ifAbsent: nil)
		ifNil: [ 
			itemsByKey
				at: anItem firstKey 
				put:
					(IdentityDictionary new
						at: anItem secondKey put: anItem;
						yourself) ]
		ifNotNil: [ :dict | dict at: anItem secondKey put: anItem ]
]

{ #category : #accessing }
JEColumn >> like: anItem [
	" Answer an item in the receiver that is equal to anItem, nil if no such item is found. 
	 Optimize for efficiency.
	^ itemsByKey detect: [ :each | each equals: anItem ] ifNone: [ nil ] "

	(itemsByKey at: anItem firstKey ifAbsent: nil)
		ifNotNil: [ :dict | 
			(dict at: anItem secondKey ifAbsent: nil)
				ifNotNil: [ :found | 
					^ (found equals: anItem) ifTrue: [ found ]	ifFalse: [ nil ] ] ].
	^ nil
]

{ #category : #adding }
JEColumn >> moveDotForward: previousItem [
	" Optimize for efficiency. 
		if the item already exits 
			then return it 
			else add it last"

	(itemsByKey at: previousItem dottedRule moveDotForward ifAbsent: nil)
		ifNotNil: [ :dict | 
			(dict at: previousItem start ifAbsent: nil)
				ifNotNil: [ :found | ^ found ] ].

	^ self basicAdd: previousItem moveDotForward
]

{ #category : #accessing }
JEColumn >> number [
	^ number
]

{ #category : #accessing }
JEColumn >> predictedItems [
	^ Array
		streamContents: [ :s | 
			itemsByKey
				associationsDo:
					[ :assoc | 
						assoc value 
							select: [ :each | each isPredicted ] 
							thenDo: [ :each | s nextPut: each ] ] ]
]

{ #category : #private }
JEColumn >> predictionItemsByNonterminalAt: nonterminal put: anItem [
	(predictionItemsByNonterminal at: nonterminal ifAbsent: nil)
		ifNil: [ 
			predictionItemsByNonterminal
				at: nonterminal
				put:
					(SinglyLinkedList new
						addLast: anItem;
						yourself) ]
		ifNotNil: [ :list | list addLast: anItem ]
]

{ #category : #accessing }
JEColumn >> predictionItemsWithSymbolAtDotIs: aNonterminal [
	^ predictionItemsByNonterminal at: aNonterminal ifAbsent: #()
]

{ #category : #printing }
JEColumn >> printOn: aStream [
	"Column [number]"

	aStream nextPutAll: 'Column ['.
	number printOn: aStream.
	aStream nextPut: $]
]

{ #category : #accessing }
JEColumn >> processItems: aBlock [
	"process each item in order"

	[ items isEmpty ] whileFalse: [ aBlock value: items next ]
]

{ #category : #'initialize-release' }
JEColumn >> release [
	"a column has references to items and an item has references to a column"

	items := nil.
	predictionItemsByNonterminal := nil.
	finalItemsByNonterminal := nil.
	itemsByKey := nil.
	super release
]

{ #category : #printing }
JEColumn >> shortPrintOn: aStream [
	"number"

	number printOn: aStream
]

{ #category : #accessing }
JEColumn >> size [
	| tally |
	tally := 0.
	itemsByKey associationsDo: [ :assoc | tally := tally + assoc value size ].
	^ tally
]
