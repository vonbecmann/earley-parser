initialization
initializeTerminal: aTerminal word: aWord startedAt: column
	self initialize.
	terminal := aTerminal.
	word := aWord.
	start := column.
	key := JEOrderedPair first: terminal second: start