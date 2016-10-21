private operations
predict: item at: chart
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
	
	i.e. when predicting an nonterminal Y in a chart k
			if there's a completed item with head Y (created in k) in the chart k
			then
				complete that completed item again in chart k,
				because we may missed to complete a newly created item.
	"

	self predictNonterminal: item symbolAtDot at: chart.
	item finalItemsWithHeadIsSymbolAtDot do: [ :again | self complete: again at: chart ]