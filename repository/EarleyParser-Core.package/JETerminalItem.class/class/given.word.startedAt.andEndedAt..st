instance creation
given: aTerminal word: aWord startedAt: firstChart andEndedAt: secondChart
	"
	a terminal item for the given terminal 
	that started its recognition at first chart and ended at second chart
	"

	^ (self basicNew initializeTerminal: aTerminal word: aWord startedAt: firstChart)
		endChart: secondChart;
		yourself