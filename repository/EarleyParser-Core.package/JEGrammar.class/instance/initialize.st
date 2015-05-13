initialization
initialize
	super initialize.
	startSymbol := JENonterminal named: 'START'.
	rules := OrderedCollection new.
	alternatives := Dictionary new