public
parse: words
	[ 
	| charts finalItem |
	charts := self basicAccepts: words.
	finalItem := self startRule dotAtEnd startedAt: charts first.
	^ (charts last includes: finalItem)
		ifTrue: [ 
			| treeGraph |
			treeGraph := builder build treeRootedAt: (charts last like: finalItem).
			charts do: [ :each | each removeAll ].
			treeGraph ]
		ifFalse: [ JEFailure atPosition: charts last number ] ]
		ensure: [ builder reset ]