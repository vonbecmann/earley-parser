initialization
initializeDottedRule: aRule start: column
	self initialize.
	dottedRule := aRule.
	start := column.
	key := JEOrderedPair first: dottedRule second: start