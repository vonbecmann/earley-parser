instance creation
given: aTerminal word: aWord startedAt: firstColumn
	"
	a terminal item for the given terminal 
	that started its recognition at first column
	"

	^ self basicNew initializeTerminal: aTerminal word: aWord startedAt: firstColumn