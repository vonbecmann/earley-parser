"
to help in analize Earley's forest parser.
"
Class {
	#name : #JEAnalyticalForestParser,
	#superclass : #JEForestParser,
	#category : #'EarleyAnalyzer-Core'
}

{ #category : #parsing }
JEAnalyticalForestParser >> parse: words [
	"it returns some stats"

	^ [ | chart forest |
	chart := self evaluate: words.
	forest := chart last
		like: (grammar startRule dotAtEnd startedAt: chart first)
		ifFound: [ :found | JEParseForest given: (self newForestFrom: found) of: grammar ]
		ifNone: [ JEFailure failedAtLast: chart last ].
	OrderedDictionary
		newFrom:
			{('chart' -> chart).
			('accepts' -> true).
			('forest' -> forest).
			('chart stats'
				->
					(OrderedDictionary
						newFrom:
							{('each column size' -> (chart collect: [ :each | each size ])).
							('total item count' -> (chart collect: [ :each | each size ]) sum)})).
			('words size' -> words size)} ]
		on: JEFailure
		do: [ :ex | 
			Dictionary
				newFrom:
					{('expected symbols' -> ex expectedSymbols).
					('position' -> ex position).
					('accepts' -> false).
					('message' -> ex messageText)} ]
]
