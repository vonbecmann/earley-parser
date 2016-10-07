public
parse: words
	"returns a Binary Shared Packed Parse Forest"

	| charts finalItem |
	charts := self basicAccepts: words.
	finalItem := grammar startRule dotAtEnd startedAt: charts first.
	^ (charts last includes: finalItem)
			ifTrue: [ self buildForestFrom: (charts last like: finalItem) ]
			ifFalse: [ self failedAt: charts last ]