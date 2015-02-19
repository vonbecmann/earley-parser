enumerating
predictionItemsWithDotAt: aNonterminal
	^ items select: [ :item | item isFinal not and: [ item symbolAtDot = aNonterminal ] ]