initialization
initializeTerminal: aTerminal word: aWord startedAt: aChart
	self initialize.
	terminal := aTerminal.
	word := aWord.
	startChart := aChart.
	key := JEOrderedPair first: terminal second: startChart