accessing
collectPredictionItemsWithDotAt: aNonterminal using: collectBlock
	^ items select: [ :item | item isFinal not and: [ item symbolAtDot = aNonterminal ] ] thenCollect: collectBlock