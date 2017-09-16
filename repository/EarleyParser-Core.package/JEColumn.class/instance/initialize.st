initialization
initialize
	super initialize.
	items := SinglyLinkedQueue new.
	predictionItemsByNonterminal := IdentityDictionary new.
	finalItemsByNonterminal := IdentityDictionary new.
	itemsByKey := IdentityDictionary new