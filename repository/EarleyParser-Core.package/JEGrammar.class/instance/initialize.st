initialization
initialize
	super initialize.
	startSymbol := JENonterminal start.
	rules := Set new.
	nonterminals := Set with: startSymbol.
	nonterminalIndex := Dictionary with: startSymbol -> 0.
	nonterminalSort := [ :a :b | (nonterminalIndex at: a) < (nonterminalIndex at: b) ].
	terminals := Set new.
	alternatives := JEMultiValuedDictionary dictionary: Dictionary collection: OrderedCollection.
	dottedAlternatives := JEMultiValuedDictionary dictionary: IdentityDictionary collection: JELinkedList