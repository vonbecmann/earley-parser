initialization
initialize
	super initialize.
	debugOn := false.
	startSymbol := JENonterminal named: 'Start'.
	rules := OrderedCollection new.
	alternatives := Dictionary new