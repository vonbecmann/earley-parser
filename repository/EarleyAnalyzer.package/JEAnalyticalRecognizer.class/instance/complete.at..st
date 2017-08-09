private operations
complete: item at: column
	moveDotForwardCount := moveDotForwardCount
		+ item predictionItemsWithSymbolAtDotIsHead size.
	completeCount := completeCount + 1.
	super complete: item at: column