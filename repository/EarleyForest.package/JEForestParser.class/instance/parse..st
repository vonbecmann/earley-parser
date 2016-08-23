public
parse: words
	"returns a parse forest"

	| charts finalItem |
	charts := self basicAccepts: words.
	finalItem := grammar startRule dotAtEnd startedAt: charts first andEndedAt: charts last.
	^ (charts last includes: finalItem)
		ifTrue: [ JEParseForest
				given: (JESPPForest root: (charts last like: finalItem) node)
				of: grammar ]
		ifFalse: [ self failedAtPosition: charts last number ]