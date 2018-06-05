"
i am signaled when a chart is empty or the last chart doesn't include the final item. 
that means that something went wrong during the processing of the input sentence.

failedAtEnd 
	- true if it failed at the end of the input sentence.
	- false if it failed in the middle of the input sentence.
position - index on the input sentence.
actual - actual character found in the input sentence.
expected symbols - terminals or nonterminals expected next in the input sentence.

"
Class {
	#name : #JEFailure,
	#superclass : #Error,
	#instVars : [
		'failedAtEnd',
		'expectedSymbols',
		'position',
		'actual'
	],
	#category : #'EarleyParser-Core-Implementation'
}

{ #category : #accessing }
JEFailure class >> failedAt: column got: anObject [
	" failed at the given column because it got an object that it isn't one of the expected symbols. "

	^ self new
		expectedSymbols: column expectedSymbols;
		position: column number;
		actual: anObject;
		signal
]

{ #category : #accessing }
JEFailure class >> failedAtLast: column [
	" failed at last column. the position is not relevant and there is no actual object because we are at the end "

	^ self new
		failedAtEnd;
		expectedSymbols: column expectedSymbols;
		signal
]

{ #category : #accessing }
JEFailure >> actual [
	^ actual
]

{ #category : #initialization }
JEFailure >> actual: anObject [ 
	actual := anObject 
]

{ #category : #accessing }
JEFailure >> expectedSymbols [
	"expected symbols (terminals or nonterminals)"

	^ expectedSymbols
]

{ #category : #initialization }
JEFailure >> expectedSymbols: aSymbolCollection [
	expectedSymbols := aSymbolCollection
]

{ #category : #initialization }
JEFailure >> failedAtEnd [
	failedAtEnd := true
]

{ #category : #initialization }
JEFailure >> initialize [
	super initialize.
	failedAtEnd := false.
	position := actual := nil
]

{ #category : #accessing }
JEFailure >> messageText [
	"Return an exception's message text."

	^ messageText
		ifNil: [ 
			messageText := String
				streamContents: [ :s | 
					failedAtEnd
						ifTrue: [ 
							s nextPutAll: 'Failed at end' ]
						ifFalse: [ 
							s
								nextPutAll: 'Failed at position ';
								print: position;
								nextPutAll: ' got ';
								print: actual ].
					s nextPutAll: ' and expected one of {'.
					expectedSymbols do: [ :each | s print: each ] separatedBy: [ s nextPutAll: ', ' ].
					s nextPut: $} ] ]
]

{ #category : #accessing }
JEFailure >> position [
	"return the error location"

	^ position
]

{ #category : #initialization }
JEFailure >> position: anInteger [
	position := anInteger
]

{ #category : #accessing }
JEFailure >> wasAtEnd [
	^ failedAtEnd
]
