instance creation
given: aTerminal word: aWord startedAt: firstItemSet andEndedAt: secondItemSet
	"
	a terminal item for the given terminal 
	that started its recognition at first item set and ended at second item set
	"

	^ (self basicNew initializeTerminal: aTerminal word: aWord startedAt: firstItemSet)
		end: secondItemSet;
		yourself