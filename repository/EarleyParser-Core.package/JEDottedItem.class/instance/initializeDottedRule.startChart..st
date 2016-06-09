initialization
initializeDottedRule: aRule startChart: aChart
	self initialize.
	dottedRule := aRule.
	startChart := aChart.
	key := JEPair first: startChart number second: dottedRule key