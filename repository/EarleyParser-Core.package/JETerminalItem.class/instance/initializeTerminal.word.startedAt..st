initialization
initializeTerminal: aTerminal word: aWord startedAt: itemSet
	self initialize.
	terminal := aTerminal.
	word := aWord.
	start := itemSet.
	key := JEOrderedPair first: terminal second: start