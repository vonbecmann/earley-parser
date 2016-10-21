initialization
initializeTerminal: aTerminal word: aWord startedAt: aChart
	self initialize.
	terminal := aTerminal.
	word := aWord.
	startChart := aChart.
	key := OrderedPair first: terminal second: startChart