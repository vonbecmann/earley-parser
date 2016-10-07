error handling
failedAt: chart
	| expectedSymbols |
	expectedSymbols := Set new.
	expectedSymbols
		addAll: (chart activeItems collect: [ :each | each symbolAtDot ]);
		addAll: (chart predictedItems select: [ :each | each symbolAtDot isTerminal ] thenCollect: [ :each | each symbolAtDot ]).
	^ JEFailure atPosition: chart number expectedSymbols: expectedSymbols asArray