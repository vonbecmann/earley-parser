"
failure at the end of the input string
"
Class {
	#name : #JEFailureAtEnd,
	#superclass : #JEFailure,
	#category : #'EarleyParser-Core-Implementation'
}

{ #category : #accessing }
JEFailureAtEnd >> messageText [
	"Return an exception's message text."

	^ messageText
		ifNil: [
			messageText := String
				streamContents: [ :s |
					s nextPutAll: 'Failed at end and expected one of {'.
					expectedSymbols
						do: [ :each | s print: each ]
						separatedBy: [ s nextPutAll: ', ' ].
					s nextPut: $} ] ]
]

{ #category : #accessing }
JEFailureAtEnd >> wasAtEnd [
	" true because it failed at the end of the input sentence. "

	^ true
]
