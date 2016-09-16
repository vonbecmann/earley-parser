initialization
initializeDottedRule: aRule startChart: aChart
	self initialize.
	dottedRule := aRule.
	startChart := aChart.
	key := {dottedRule key. startChart number}