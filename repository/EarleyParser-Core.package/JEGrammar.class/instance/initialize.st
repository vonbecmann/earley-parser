initialization
initialize
	super initialize.
	startSymbol := JENonterminal start.
	nonterminals := Set with: startSymbol.
	terminals := Set new.
	rules := Set new.
	alternatives := OrderedDictionary new.
	dottedAlternatives := JEMultiValuedDictionary dictionary: IdentityDictionary collection: JELinkedList