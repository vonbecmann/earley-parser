"
Jay Earley Algorithm as a Recognizer.
recognition is not parsing.

"
Class {
	#name : #JERecognizer,
	#superclass : #JEAlgorithm,
	#category : #'EarleyParser-Core-Implementation'
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
JERecognizer >> complete: item [
	item predictionItemsWithSymbolAtDotIsHeadDo: [ :previous | item end moveDotForward: previous ]
]

{ #category : #'private operations' }
JERecognizer >> scan: item with: word at: column [
	column moveDotForward: item
]
