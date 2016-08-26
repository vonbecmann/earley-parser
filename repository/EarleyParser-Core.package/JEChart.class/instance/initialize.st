initialization
initialize
	super initialize.
	items := JELinkedList new.
	predictionItemsByNonterminal := MultiValuedDictionary
		dictionary: IdentityDictionary
		collection: JELinkedList.
	finalItemsByNonterminal := MultiValuedDictionary
		dictionary: IdentityDictionary
		collection: JELinkedList.
	itemsByKey := Dictionary new.
	terminalItems := Set new