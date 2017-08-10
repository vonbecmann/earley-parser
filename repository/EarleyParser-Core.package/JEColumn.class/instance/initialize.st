initialization
initialize
	super initialize.
	items := SinglyLinkedQueue new.
	predictionItemsByNonterminal := IdentityDictionary new.
	finalItemsByNonterminal := MultiValuedDictionary
		dictionary: IdentityDictionary
		collection: SinglyLinkedList.
	itemsByKey := IdentityDictionary new