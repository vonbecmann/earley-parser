public
parse: words
	| charts finalItem |
	builder := JEHypergraphBuilder new.
	charts := self basicAccepts: words.
	finalItem := grammar startRule dotAtEnd startedAt: charts first andEndedAt: charts last.
	^ (charts last includes: finalItem)
		ifTrue: [ JEParseForest given: (builder build treeRootedAt: finalItem asNode) of: grammar ]
		ifFalse: [ self failedAtPosition: charts last number ]