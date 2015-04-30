initialization
initialize
	super initialize.
	items := JELinkedList new.
	itemsByChart := Dictionary new.
	edges := JELinkedList new