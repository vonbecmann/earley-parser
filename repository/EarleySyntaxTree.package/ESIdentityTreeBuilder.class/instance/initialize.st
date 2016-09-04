initialization
initialize
	super initialize.
	rootNode := nil.
	nodes := IdentityDictionary new.
	edges := ArrayMultiValuedDictionary dictionary: IdentityDictionary