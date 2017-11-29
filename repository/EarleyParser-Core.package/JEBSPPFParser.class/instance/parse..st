public
parse: words
	"returns a Binary Shared Packed Parse Forest"

	| chart finalItem |
	chart := self evaluate: words.
	finalItem := grammar startRule dotAtEnd startedAt: chart first.
	^ (chart last includes: finalItem)
			ifTrue: [ self buildForestFrom: (chart last like: finalItem) ]
			ifFalse: [ self failedAt: chart last ]