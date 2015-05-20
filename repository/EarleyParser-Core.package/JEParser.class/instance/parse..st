public
parse: words
	| charts finalItem |
	builder := JEHypergraphBuilder new.
	charts := self basicAccepts: words.
	finalItem := grammar startRule dotAtEnd startedAt: charts first.
	^ (charts last includes: finalItem)
		ifTrue: [ 
			| treeGraph |
			treeGraph := builder build treeRootedAt: (JEConstituent value: grammar startSymbol start: 1 end: charts last number).
			charts do: [ :each | each removeAll ].
			treeGraph ]
		ifFalse: [ self failedAtPosition: charts last number ]