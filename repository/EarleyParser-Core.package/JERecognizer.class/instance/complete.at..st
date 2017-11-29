private operations
complete: item at: column
	item predictionItemsWithSymbolAtDotIsHead
		do: [ :previous | column moveDotForward: previous ]