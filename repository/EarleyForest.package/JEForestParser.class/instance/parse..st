public
parse: words
	"returns a parse forest"

	| charts finalItem |
	charts := self basicAccepts: words.
	finalItem := grammar startRule dotAtEnd startedAt: charts first andEndedAt: charts last.
	^ (charts last includes: finalItem)
		ifTrue: [ JEParseForest
				given: (self buildForestFrom: (charts last like: finalItem))
				of: grammar ]
		ifFalse: [ self failedAtPosition: charts last number ]