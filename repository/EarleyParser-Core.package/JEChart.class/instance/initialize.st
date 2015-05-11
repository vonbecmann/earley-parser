initialization
initialize
	super initialize.
	items := JELinkedList new.
	pointers := IdentityDictionary new.
	predictionItemsByNonterminal := Dictionary new