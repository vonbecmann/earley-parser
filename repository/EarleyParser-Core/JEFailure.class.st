"
i am signaled when a chart is empty or the last chart doesn't include the final item. 
that means that something went wrong during the processing of the input sentence.

position - index on the input sentence.
expected symbols - terminals or nonterminals expected next in the input sentence.

"
Class {
	#name : #JEFailure,
	#superclass : #Error,
	#instVars : [
		'position',
		'expectedSymbols'
	],
	#category : 'EarleyParser-Core-Implementation'
}

{ #category : #accessing }
JEFailure class >> failedAt: column [
	^ self new
		initializePosition: column number andExpectedSymbols: column expectedSymbols;
		signal
]

{ #category : #accessing }
JEFailure >> expectedSymbols [
	"expected symbols (terminals or nonterminals)"

	^ expectedSymbols
]

{ #category : #initialization }
JEFailure >> initializePosition: anInteger andExpectedSymbols: aCollection [
	position := anInteger.
	expectedSymbols := aCollection.
	messageText := String
			streamContents: 
				[ :s | 
					s
						nextPutAll: 'Failed at position ';
						print: position;
						nextPutAll: ' and expected one of {'.
					expectedSymbols do: [ :each | s print: each ] separatedBy: [ s nextPutAll: ', ' ].
					s nextPut: $} ]
]

{ #category : #accessing }
JEFailure >> position [
	"return the error location"

	^ position
]
