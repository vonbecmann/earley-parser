"
a column of items at the given position in the chart.

acts as a set of items.

Nonterminals are unique, that's why they are use as a key in the dictionaries.

number - a position in the chart.
items - as they were added to the column.
itemsToProcess - a queue of items to be processed in order.

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
		'itemsToProcess',
		'predictionItemsByNonterminal',
		'finalItemsByNonterminal',
		'itemsByKey'
	],
	#category : #'EarleyParser-Core-Implementation'
}

{ #category : #'instance creation' }
JEColumn class >> number: anInteger [
	^ self basicNew initializeNumber: anInteger
]

{ #category : #'instance creation' }
JEColumn class >> numberOneWith: aDottedRule [
	^ (self number: 1)
		addDottedRule: aDottedRule;
		yourself
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

{ #category : #adding }
JEColumn >> add: aDottedItem [
	" Optimize for efficiency.
		if the item doesn't exist then add it last.
		this is a predicted item "

	itemsByKey
		jeAt: aDottedItem firstKey
		at: aDottedItem secondKey
		ifAbsentPut: [ self addDottedItem: aDottedItem ]
]

{ #category : #private }
JEColumn >> addDottedItem: dottedItem [
	dottedItem isFinal
		ifTrue: [
			dottedItem start = self
				ifTrue: [ self finalItemsByNonterminalAt: dottedItem head put: dottedItem ] ]
		ifFalse: [
			dottedItem symbolAtDot isNonterminal
				ifTrue: [
					predictionItemsByNonterminal
						jeAt: dottedItem symbolAtDot
						ifPresent: [ :list | list addLast: dottedItem ]
						ifAbsentPut:
							[	SinglyLinkedList new
									addLast: dottedItem;
									yourself ] ] ].
	itemsToProcess nextPut: dottedItem.
	dottedItem end: self.
	^ items addLast: dottedItem
]

{ #category : #adding }
JEColumn >> addDottedRule: dottedRule [
	" Optimize for efficiency.
	  add an item with this dotted rule starting at this column "

	itemsByKey
		jeAt: dottedRule
		at: self
		ifAbsentPut: [ self addDottedItem: (dottedRule startedAt: self) ]
]

{ #category : #parsing }
JEColumn >> addTerminalItem: terminalItem [
	" add a scanned terminal while parsing "

	^ itemsByKey
		jeAt: terminalItem firstKey
		at: terminalItem secondKey
		ifAbsentPut: [
			terminalItem end: self.
			items addLast: terminalItem ]
]

{ #category : #accessing }
JEColumn >> expectedSymbols [
	| expectedSymbols |
	expectedSymbols := Set new.
	items
		do: [ :item |
			item isActive
				ifTrue: [ expectedSymbols add: item symbolAtDot ].
			(item isPredicted and: [ item isRepresentation ])
				ifTrue: [ expectedSymbols add: item head ] ].
	^ expectedSymbols asArray
]

{ #category : #private }
JEColumn >> finalItemsByNonterminalAt: nonterminal put: anItem [
	finalItemsByNonterminal
		jeAt: nonterminal
		ifPresent: [ :list | list addLast: anItem ]
		ifAbsentPut:
			[	SinglyLinkedList new
					addLast: anItem;
					yourself ]
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
JEColumn >> ifEmpty: aBlock [
	"Evaluate the given block, answering its value if the receiver is empty, otherwise answer the receiver."

	^ self isEmpty
		ifTrue: [ aBlock value ]
		ifFalse: [ self ]
]

{ #category : #testing }
JEColumn >> includes: anItem [
	"Answer whether an Item is present.
	Optimize for efficiency.
	itemsByKey anySatisfy: [ :each | each equals: anItem ]."

	^ itemsByKey
		jeAt: anItem firstKey
		at: anItem secondKey
		ifPresent: [ :found | found equals: anItem ]
		ifAbsent: [ false ]
]

{ #category : #initialization }
JEColumn >> initialize [
	itemsToProcess := SinglyLinkedQueue new.
	items := SinglyLinkedList new.
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
	^ items isEmpty
]

{ #category : #accessing }
JEColumn >> like: anItem ifFound: foundBlock ifNone: exceptionBlock [
	" Optimize for efficiency.
	 ^ itemsByKey
			detect: [ :item | item equals: anItem ]
			ifFound: foundBlock
			ifNone: exceptionBlock "

	^ itemsByKey
		jeAt: anItem firstKey
		at: anItem secondKey
		ifPresent: [ :found |
			(found equals: anItem)
				ifTrue: [ foundBlock cull: found ]
				ifFalse: [ exceptionBlock value ] ]
		ifAbsent: exceptionBlock
]

{ #category : #adding }
JEColumn >> moveDotForward: previousItem [
	" Optimize for efficiency.
		if the item already exits
			then return it
			else add it last"

	^ itemsByKey
		jeAt: previousItem dottedRule moveDotForward
		at: previousItem secondKey
		ifAbsentPut: [ self addDottedItem: previousItem moveDotForward ]
]

{ #category : #accessing }
JEColumn >> number [
	^ number
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

	[ itemsToProcess isEmpty ] whileFalse: [ aBlock value: itemsToProcess next ]
]

{ #category : #'initialize-release' }
JEColumn >> release [
	"a column has references to items and an item has references to a column"

	items := nil.
	itemsToProcess := nil.
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
	^ items size
]
