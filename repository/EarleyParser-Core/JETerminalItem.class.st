"
a terminal item that starts and ends at the given item sets.

a terminal matches a word in the input string while parsing between start and end item sets.

[  terminal  @ [ start , end ] ].

I'm a special case of item.
node 
	- is a packed parse node with no families.
	

"
Class {
	#name : #JETerminalItem,
	#superclass : #JEItem,
	#instVars : [
		'terminal',
		'word'
	],
	#category : 'EarleyParser-Core-Parsing'
}

{ #category : #'instance creation' }
JETerminalItem class >> given: aTerminal word: aWord startedAt: firstColumn [
	"
	a terminal item for the given terminal 
	that started its recognition at first column
	"

	^ self basicNew initializeTerminal: aTerminal word: aWord startedAt: firstColumn
]

{ #category : #'instance creation' }
JETerminalItem class >> given: aTerminal word: aWord startedAt: firstColumn andEndedAt: secondColumn [
	"
	a terminal item for the given terminal 
	that started its recognition at first column and ended at second column
	"

	^ (self basicNew initializeTerminal: aTerminal word: aWord startedAt: firstColumn)
		end: secondColumn;
		yourself
]

{ #category : #comparing }
JETerminalItem >> = anObject [
	self == anObject
		ifTrue: [ ^ true ].
	self class == anObject class
		ifFalse: [ ^ false ].
	start = anObject start
		ifFalse: [ ^ false ].
	end = anObject end
		ifFalse: [ ^ false ].
	terminal = anObject terminal
		ifFalse: [ ^ false ].
	^ true
]

{ #category : #comparing }
JETerminalItem >> equals: anItem [
	^ (super equals: anItem) and: [ terminal = anItem terminal ]
]

{ #category : #accessing }
JETerminalItem >> firstKey [
	^ terminal
]

{ #category : #comparing }
JETerminalItem >> hash [
	^ (terminal hash + (start hash + end hash) hashMultiply) hashMultiply
]

{ #category : #initialization }
JETerminalItem >> initializeTerminal: aTerminal word: aWord startedAt: column [
	self initialize.
	terminal := aTerminal.
	word := aWord.
	start := column
]

{ #category : #testing }
JETerminalItem >> isActive [
	^ false
]

{ #category : #testing }
JETerminalItem >> isFinal [
	^ true
]

{ #category : #testing }
JETerminalItem >> isNonterminal [
	^ false
]

{ #category : #testing }
JETerminalItem >> isPredicted [
	^ false
]

{ #category : #testing }
JETerminalItem >> isTerminal [
	^ true
]

{ #category : #parsing }
JETerminalItem >> node [
	node ifNil: [ node := JEPackedNode model: self ].
	^ node
]

{ #category : #printing }
JETerminalItem >> printOn: aStream [
	"[ terminal @ [ start, end ] ]"

	aStream nextPut: $[.
	terminal printOn: aStream.
	aStream nextPutAll: ' @ '.
	self printIntervalOn: aStream.
	aStream nextPut: $]
]

{ #category : #'initialize-release' }
JETerminalItem >> release [
	terminal := nil.
	word := nil.
	super release
]

{ #category : #accessing }
JETerminalItem >> secondKey [
	^ start
]

{ #category : #accessing }
JETerminalItem >> terminal [
	^ terminal
]

{ #category : #accessing }
JETerminalItem >> word [
	^ word
]
