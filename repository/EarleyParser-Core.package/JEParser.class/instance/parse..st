public
parse: words
	| charts finalItem |
	builder := JEHypergraphBuilder new.
	charts := self basicAccepts: words.
	finalItem := grammar startRule dotAtEnd startedAt: charts first.
	^ (charts last includes: finalItem)
		ifTrue: [ 
			| treeGraph |
			treeGraph := builder build treeRootedAt: (charts last like: finalItem).
			charts do: [ :each | each removeAll ].
			treeGraph ]
		ifFalse: [ self failedAtPosition: charts last number ]