private operations
complete: item at: itemSet
	"
	Complete:
		For every state in S(k) of the form (X -> y *, j), 
		find states in S(j) of the form (Y -> a * X b, i) and 
			add (Y -> a X * b, i) to S(k).
	Optimized for efficiency.
	"

	item predictionItemsWithSymbolAtDotIsHead
		do: [ :previous | 
					self 
						addFamilyWith: previous 
						and: item 
						to: (itemSet moveDotForward: previous) ]