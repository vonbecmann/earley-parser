public
parse: words
	| charts graph finalItem |
	charts := self basicAccepts: words.
	finalItem := self startRule dotAtEnd startedAt: charts first.
	^ (charts last includes: finalItem)
		ifTrue: [ 
			graph := builder build.
			"graph forestStartingAtNodeLabeled: (charts last like: finalItem)" ]
		ifFalse: [ OrderedCollection new ]