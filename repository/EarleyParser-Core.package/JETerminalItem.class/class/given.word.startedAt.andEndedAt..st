instance creation
given: aTerminal word: aWord startedAt: firstColumn andEndedAt: secondColumn
	"
	a terminal item for the given terminal 
	that started its recognition at first column and ended at second column
	"

	^ (self basicNew initializeTerminal: aTerminal word: aWord startedAt: firstColumn)
		end: secondColumn;
		yourself