initialization
initialize
	super initialize.
	items := JELinkedList new.
	predictionItemsByNonterminal := JEMultiValuedDictionary
		dictionary: IdentityDictionary
		collection: JELinkedList.
	finalItemsByNonterminal := JEMultiValuedDictionary
		dictionary: IdentityDictionary
		collection: JELinkedList.
	itemsByKey := Dictionary new.
	terminalNodes := Set new