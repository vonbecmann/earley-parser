initialization
initialize
	super initialize.
	startSymbol := JENonterminal start.
	rules := OrderedCollection new.
	alternatives := JEMultiValuedDictionary dictionary: Dictionary collection: OrderedCollection