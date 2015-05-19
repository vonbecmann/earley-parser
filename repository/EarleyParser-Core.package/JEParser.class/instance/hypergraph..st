private
hypergraph: words
	"the full hypergraph of the parsing of the words"

	| charts finalItem |
	builder := JEHypergraphBuilder new.
	charts := self basicAccepts: words.
	finalItem := grammar startRule dotAtEnd startedAt: charts first.
	^ (charts last includes: finalItem)
		ifTrue: [ 
			| graph |
			graph := builder build.
			charts do: [ :each | each removeAll ].
			graph ]
		ifFalse: [ self failedAtPosition: charts last number ]