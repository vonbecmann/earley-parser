public
parse: words
	| charts finalItem |
	charts := self basicAccepts: words.
	finalItem := grammar startRule dotAtEnd startedAt: charts first andEndedAt: charts last.
	^ (charts last includes: finalItem)
		ifTrue: [ JEParseForest given: (self buildTreeRootedAt: (charts last like: finalItem)) of: grammar ]
		ifFalse: [ self failedAtPosition: charts last number ]