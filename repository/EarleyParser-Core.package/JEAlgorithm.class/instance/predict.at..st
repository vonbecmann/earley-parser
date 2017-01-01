private operations
predict: item at: itemSet
	"
	Prediction:
		For every state in S(k) of the form (X -> a * Y b, j),
		add (Y -> * y, k) to S(k)
 	 		for every production in the grammar with Y on the left-hand side (Y -> y).
		
	i.e. add all respective predicted items for the given collection of dotted rules
	
	Complete Again:
		For every state in S(k) of the form (X -> a * Y b, j),
		For every state in S(k) of the form (Y -> y *, k),	
			Complete (Y -> y *, k) in S(k).
	
	i.e. when predicting an nonterminal Y in item set k
			if there's a completed item with head Y (created in k) in the item set k
			then
				complete that completed item again in item set k,
				because we may missed to complete a newly created item.
	"

	self predictNonterminal: item symbolAtDot at: itemSet.
	item finalItemsWithHeadIsSymbolAtDot do: [ :again | self complete: again at: itemSet ]