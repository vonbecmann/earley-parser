initialization
initialize
	super initialize.
	items := SinglyLinkedQueue new.
	predictionItemsByNonterminal := MultiValuedDictionary
		dictionary: IdentityDictionary
		collection: SinglyLinkedList.
	finalItemsByNonterminal := MultiValuedDictionary
		dictionary: IdentityDictionary
		collection: SinglyLinkedList.
	itemsByKey := Dictionary new.
	terminalItems := Set new