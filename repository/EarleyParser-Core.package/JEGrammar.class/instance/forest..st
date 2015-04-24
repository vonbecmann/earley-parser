private 
forest: words 
	| graph |
	graph := self hypergraph: words.
	^ graph forestStartingAtNodeLabeled: startSymbol.