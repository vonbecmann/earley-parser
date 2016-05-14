initialization
initialize
	super initialize.
	startSymbol := JENonterminal start.
	rules := Set new.
	nonterminals := Set new.
	terminals := Set new.
	alternatives := JEMultiValuedDictionary dictionary: IdentityDictionary collection: JELinkedList