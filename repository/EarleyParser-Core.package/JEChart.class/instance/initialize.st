initialization
initialize
	super initialize.
	items := JELinkedList new.
	predictionItemsByNonterminal := JEMultiValuedDictionary dictionary: Dictionary collection: JELinkedList.
	finalItemsByNonterminal := JEMultiValuedDictionary dictionary: Dictionary collection: JELinkedList