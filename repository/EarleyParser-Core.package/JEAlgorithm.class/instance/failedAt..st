error handling
failedAt: itemSet
	| expectedSymbols |
	expectedSymbols := Set new.
	expectedSymbols
		addAll: (itemSet activeItems collect: [ :each | each symbolAtDot ]);
		addAll: (itemSet predictedItems select: [ :each | each symbolAtDot isTerminal ] thenCollect: [ :each | each symbolAtDot ]).
	^ JEFailure atPosition: itemSet number expectedSymbols: expectedSymbols asArray