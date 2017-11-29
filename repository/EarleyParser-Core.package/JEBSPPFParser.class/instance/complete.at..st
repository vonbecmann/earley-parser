private operations
complete: item at: column
	item predictionItemsWithSymbolAtDotIsHead
		do: [ :previous | 
					self 
						addFamilyWith: previous 
						and: item 
						to: (column moveDotForward: previous) ]