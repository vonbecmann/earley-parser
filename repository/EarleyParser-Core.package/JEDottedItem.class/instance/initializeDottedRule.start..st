initialization
initializeDottedRule: aRule start: itemSet
	self initialize.
	dottedRule := aRule.
	start := itemSet.
	key := JEOrderedPair first: dottedRule second: start