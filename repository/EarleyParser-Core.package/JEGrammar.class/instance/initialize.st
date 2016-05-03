initialization
initialize
	super initialize.
	startSymbol := JENonterminal start.
	rules := OrderedCollection new.
	alternatives := JEMultiValuedDictionary dictionary: OrderedDictionary collection: JELinkedList