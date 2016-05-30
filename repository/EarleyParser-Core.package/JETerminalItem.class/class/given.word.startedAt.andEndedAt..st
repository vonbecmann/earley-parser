instance creation
given: aTerminal word: aWord startedAt: aChart andEndedAt: anotherChart
	"
	a terminal item for the given terminal 
	that started its recognition at the given chart and ended at the given chart
	"

	^ self basicNew
		initializeTerminal: aTerminal
		word: aWord
		startedAt: aChart
		andEndedAt: anotherChart