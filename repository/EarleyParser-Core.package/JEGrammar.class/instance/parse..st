public
parse: words
	| charts graph finalItem |
	charts := self basicAccepts: words.
	graph := builder build.
	finalItem := self startRule dotAtEnd startedAt: charts first.
	^ (charts last includes: finalItem)
		ifTrue: [ graph forestStartingAtNodeLabeled: (charts last like: finalItem) ]
		ifFalse: [ OrderedCollection new ]