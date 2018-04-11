"
Jay Earley Algorithm as a Recognizer.
recognition is not parsing.

"
Class {
	#name : #JERecognizer,
	#superclass : #JEAlgorithm,
	#category : 'EarleyParser-Core-Implementation'
}

{ #category : #public }
JERecognizer >> accepts: words [
	^ [ 
	| chart |
	chart := self evaluate: words.
	chart last includes: (grammar startRule dotAtEnd startedAt: chart first) ]
		on: JEFailure
		do: [ :ex | false ]
]

{ #category : #'private operations' }
JERecognizer >> complete: item at: column [
	item predictionItemsWithSymbolAtDotIsHead
		do: [ :previous | column moveDotForward: previous ]
]

{ #category : #'private operations' }
JERecognizer >> scan: item with: word at: column [
	column moveDotForward: item
]
