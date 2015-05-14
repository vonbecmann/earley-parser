initialization
initialize
	super initialize.
	startSymbol := JENonterminal start.
	rules := OrderedCollection new.
	alternatives := Dictionary new.
	builder := JEHypergraphBuilder new