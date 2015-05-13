private
hypergraph: words
	| charts finalItem |
	charts := self basicAccepts: words.
	finalItem := self startRule dotAtEnd startedAt: charts first.
"	(charts last includes: finalItem)
		ifTrue: [ 
			builder addNodeLabeled: startSymbol from: charts first to: charts last.
			builder addEdgesStartingAt: (charts last like: finalItem) ]."
	^ builder build