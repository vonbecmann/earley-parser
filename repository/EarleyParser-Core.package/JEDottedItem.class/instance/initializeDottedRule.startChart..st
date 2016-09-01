initialization
initializeDottedRule: aRule startChart: aChart
	self initialize.
	dottedRule := aRule.
	startChart := aChart.
	key := OrderedPair first: startChart number second: dottedRule key