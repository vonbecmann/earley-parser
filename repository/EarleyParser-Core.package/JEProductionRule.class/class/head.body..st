instance creation
head: aNonterminal body: aSymbolList
	self assert: aNonterminal isTerminal not.
	^ self basicNew initializeHead: aNonterminal body: aSymbolList