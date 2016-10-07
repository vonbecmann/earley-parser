initialization
initializePosition: anInteger andExpectedSymbols: aCollection
	position := anInteger.
	expectedSymbols := aCollection.
	messageText := String
			streamContents: 
				[ :s | 
					s
						nextPutAll: 'Failed at position ';
						print: position;
						nextPutAll: ' and expected one of {'.
					expectedSymbols do: [ :each | s print: each ] separatedBy: [ s nextPutAll: ', ' ].
					s nextPut: $} ]