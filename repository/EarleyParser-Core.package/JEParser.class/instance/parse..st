public
parse: words
	| charts finalItem |
	builder := JEHypergraphBuilder new.
	charts := self basicAccepts: words.
	finalItem := grammar startRule dotAtEnd startedAt: charts first.
	^ (charts last includes: finalItem)
		ifTrue: [ 
			| treeGraph |
			treeGraph := builder build 
						treeRootedAt: (grammar startSymbol startedAt: 1 andEndedAt: charts last number).
			treeGraph ]
		ifFalse: [ self failedAtPosition: charts last number ]