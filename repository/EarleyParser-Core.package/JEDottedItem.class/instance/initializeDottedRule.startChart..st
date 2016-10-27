initialization
initializeDottedRule: aRule startChart: aChart
	self initialize.
	dottedRule := aRule.
	startChart := aChart.
	key := JEOrderedPair first: dottedRule second: startChart