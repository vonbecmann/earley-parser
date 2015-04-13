initialization
initialize
	super initialize.
	startSymbol := JENonterminal named: 'Start'.
	rules := OrderedCollection new.
	alternatives := Dictionary new