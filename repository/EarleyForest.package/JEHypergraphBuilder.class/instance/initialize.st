initialization
initialize
	super initialize.
	root := nil.
	nodes := IdentityDictionary new.
	edges := JELinkedList new