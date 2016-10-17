initialization
initialize
	super initialize.
	startSymbol := JENonterminal start.
	nonterminals := Set with: startSymbol.
	terminals := Set new.
	rules := ArrayMultiValuedDictionary dictionary: OrderedDictionary.
	alternatives := OrderedDictionary new.
	predictedAlternatives := MultiValuedDictionary
		dictionary: IdentityDictionary
		collection: SinglyLinkedList.
	dottedRules := ArrayMultiValuedDictionary dictionary: OrderedIdentityDictionary