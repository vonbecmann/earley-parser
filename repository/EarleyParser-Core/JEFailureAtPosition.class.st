"
failure at a given position in the input string.

position - index on the input sentence.
actual - actual character found in the input sentence.

"
Class {
	#name : 'JEFailureAtPosition',
	#superclass : 'JEFailure',
	#instVars : [
		'position',
		'actual'
	],
	#category : 'EarleyParser-Core-Implementation',
	#package : 'EarleyParser-Core',
	#tag : 'Implementation'
}

{ #category : 'accessing' }
JEFailureAtPosition >> actual [
	^ actual
]

{ #category : 'initialization' }
JEFailureAtPosition >> actual: anObject [
	actual := anObject
]

{ #category : 'accessing' }
JEFailureAtPosition >> messageText [
	"Return an exception's message text."

	^ messageText
		ifNil: [
			messageText := String
				streamContents: [ :s |
					s
						nextPutAll: 'Failed at position ';
						print: position;
						nextPutAll: ' got ';
						print: actual;
						nextPutAll: ' and expected one of {'.
					expectedSymbols
						do: [ :each | s print: each ]
						separatedBy: [ s nextPutAll: ', ' ].
					s nextPut: $} ] ]
]

{ #category : 'accessing' }
JEFailureAtPosition >> position [
	"return the error location"

	^ position
]

{ #category : 'initialization' }
JEFailureAtPosition >> position: anInteger [
	position := anInteger
]

{ #category : 'accessing' }
JEFailureAtPosition >> wasAtEnd [
	" false because it failed in the middle of the input sentence. "

	^ false
]
