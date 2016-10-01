instance creation
terminal: aJETerminal word: aWord start: firstIndex end: secondIndex
	^ self basicNew
		initializeTerminal: aJETerminal
		word: aWord
		start: firstIndex
		end: secondIndex