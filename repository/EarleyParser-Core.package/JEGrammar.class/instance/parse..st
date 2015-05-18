public
parse: words
	| charts finalItem |
	charts := self basicAccepts: words.
	finalItem := self startRule dotAtEnd startedAt: charts first.
	^ (charts last includes: finalItem)
		ifTrue: [ 
			| graph |
			graph := builder build.
			graph treeRootedAt: (charts last like: finalItem) ]
		ifFalse: [ OrderedCollection new ]