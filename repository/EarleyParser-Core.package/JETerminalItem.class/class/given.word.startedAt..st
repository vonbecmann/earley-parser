instance creation
given: aTerminal word: aWord startedAt: firstChart
	"
	a terminal item for the given terminal 
	that started its recognition at first
	"

	^ self basicNew initializeTerminal: aTerminal word: aWord startedAt: firstChart