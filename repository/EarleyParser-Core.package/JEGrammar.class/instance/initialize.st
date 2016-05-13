initialization
initialize
	super initialize.
	startSymbol := JENonterminal start.
	rules := Set new.
	alternatives := JEMultiValuedDictionary dictionary: OrderedDictionary collection: JELinkedList