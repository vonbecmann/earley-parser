public
parse: words
	"returns a the final item"

	| charts finalItem |
	charts := self basicAccepts: words.
	finalItem := grammar startRule dotAtEnd startedAt: charts first andEndedAt: charts last.
	^ (charts last includes: finalItem)
		ifTrue: [ (charts last like: finalItem) node ]
		ifFalse: [ self failedAtPosition: charts last number ]