instance creation
head: aNonterminal body: aSymbolArray
	self assert: aNonterminal isTerminal not.
	^ self basicNew initializeHead: aNonterminal body: aSymbolArray