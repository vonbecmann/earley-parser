private
hypergraph: words
	| charts finalItem builder |
	charts := self basicAccepts: words.
	finalItem := self startRule dotAtEnd startedAt: charts first.
	builder := JEHypergraphBuilder new.
	(charts last includes: finalItem)
		ifTrue: [ 
			builder addNodeLabeled: startSymbol from: charts first to: charts last.
			self buildNodes: builder startingAt: (charts last like: finalItem).
			self buildEdges: builder startingAt: (charts last like: finalItem) ].
	^ builder build