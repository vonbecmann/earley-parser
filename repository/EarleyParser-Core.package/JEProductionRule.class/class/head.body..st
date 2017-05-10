instance creation
head: aNonterminal body: aSymbolArray
	self assert: aNonterminal isNonterminal.
	^ self basicNew initializeHead: aNonterminal body: aSymbolArray