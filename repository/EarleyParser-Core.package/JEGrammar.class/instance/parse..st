public
parse: words
	| charts finalItem |
	charts := self basicAccepts: words.
	finalItem := self startRule dotAtEnd startedAt: charts first.
	^ (charts last includes: finalItem)
		ifTrue: [ 
			| graph treeGraph |
			graph := builder build.
			treeGraph := graph treeRootedAt: (charts last like: finalItem).
			charts do: [ :each | each removeAll ].
			treeGraph ]
		ifFalse: [ OrderedCollection new ]