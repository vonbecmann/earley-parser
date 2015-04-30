private
hypergraph: words
	| charts finalItem builder |
	charts := self basicAccepts: words.
	finalItem := self startRule dotAtEnd startedAt: charts first.
	builder := JEHypergraphBuilder new.
	(charts last includes: finalItem)
		ifTrue: [ 
			builder addNodeLabeled: startSymbol from: charts first to: charts last.
			charts last buildEdgesOn: builder startingAt: finalItem ].
	^ builder build