instance creation
symbol: aSymbol reason: aReason start: firstIndex end: secondIndex
	^ self basicNew
		initializeSymbol: aSymbol
		reason: aReason
		start: firstIndex
		andEnd: secondIndex