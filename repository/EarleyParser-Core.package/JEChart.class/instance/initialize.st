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
	itemsByKey := MultiValuedDictionary dictionary: Dictionary collection: Dictionary