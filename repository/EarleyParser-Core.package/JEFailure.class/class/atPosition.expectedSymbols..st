accessing
atPosition: anInteger expectedSymbols: aSymbolCollection
	^ self new
		initializePosition: anInteger andExpectedSymbols: aSymbolCollection;
		signal