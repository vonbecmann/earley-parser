as yet unclassified
parse: words
	| graph |
	graph := self hypergraph: words.
	^ graph forestStartingAtNodeLabeled: startSymbol