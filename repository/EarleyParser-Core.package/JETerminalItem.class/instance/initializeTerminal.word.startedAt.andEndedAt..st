initialization
initializeTerminal: aTerminal word: aWord startedAt: aChart andEndedAt: anotherChart
	self initialize.
	terminal := aTerminal.
	word := aWord.
	startChart := aChart.
	endChart := anotherChart.
	node := JEPackedNode labeled: word model: (JEHypernode model: self).
	node addFamily: JELinkedList new