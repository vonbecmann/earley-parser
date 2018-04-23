"
to help in analize Earley's recognizer.
collect some stats.

"
Class {
	#name : #JEAnalyticalRecognizer,
	#superclass : #JERecognizer,
	#instVars : [
		'addCount',
		'moveDotForwardCount',
		'completeCount',
		'predictCount',
		'scanCount'
	],
	#category : #'EarleyAnalyzer-Core'
}

{ #category : #public }
JEAnalyticalRecognizer >> accepts: words [
	"it returns some stats"

	^ [ | chart |
	chart := self evaluate: words.
	OrderedDictionary
		newFrom:
			{('chart' -> chart).
			('accepts'
				-> (chart last includes: (grammar startRule dotAtEnd startedAt: chart first))).
			('chart stats'
				->
					(OrderedDictionary
						newFrom:
							{('each column size' -> (chart collect: [ :each | each size ])).
							('total item count' -> (chart collect: [ :each | each size ]) sum)})).
			('column stats'
				->
					(OrderedDictionary
						newFrom:
							{('moveDotForward send count' -> moveDotForwardCount).
							('add send count' -> addCount).
							('total message send count' -> (moveDotForwardCount + addCount))})).
			('complete count' -> completeCount).
			('predict count' -> predictCount).
			('scan count' -> scanCount).
			('total operation count' -> (completeCount + predictCount + scanCount)).
			('words size' -> (words size))} ]
		on: JEFailure
		do: [ :ex | 
			Dictionary
				newFrom:
					{('expected symbols' -> ex expectedSymbols).
					('position' -> ex position).
					('accepts' -> false).
					('message' -> ex messageText)} ]
]

{ #category : #'private operations' }
JEAnalyticalRecognizer >> complete: item at: column [
	moveDotForwardCount := moveDotForwardCount
		+ item predictionItemsWithSymbolAtDotIsHead size.
	completeCount := completeCount + 1.
	super complete: item at: column
]

{ #category : #initialization }
JEAnalyticalRecognizer >> initialize [
	super initialize.
	addCount := moveDotForwardCount := 0.
	completeCount := predictCount := scanCount := 0
]

{ #category : #'private operations' }
JEAnalyticalRecognizer >> predictNonterminal: nonterminal at: column [
	addCount := addCount + (grammar alternativesOf: nonterminal) size.
	predictCount := predictCount + 1.
	super predictNonterminal: nonterminal at: column
]

{ #category : #'private operations' }
JEAnalyticalRecognizer >> scan: item with: word at: column [
	moveDotForwardCount := moveDotForwardCount + 1.
	scanCount := scanCount + 1.
	super scan: item with: word at: column
]
