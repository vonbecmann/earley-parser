public
parse: words
	| charts finalItem |
	builder := JEHypergraphBuilder new.
	charts := self basicAccepts: words.
	finalItem := grammar startRule dotAtEnd startedAt: charts first andEndedAt: charts last.
	^ (charts last includes: finalItem)
		ifTrue: [ 
			| treeGraph |
			treeGraph := builder build treeRootedAt: finalItem asNode.
			treeGraph ]
		ifFalse: [ self failedAtPosition: charts last number ]