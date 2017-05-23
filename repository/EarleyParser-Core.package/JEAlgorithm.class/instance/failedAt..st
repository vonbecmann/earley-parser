error handling
failedAt: column
	| expectedSymbols |
	expectedSymbols := Set new.
	expectedSymbols
		addAll: (column activeItems collect: [ :each | each symbolAtDot ]);
		addAll: (column predictedItems select: [ :each | each symbolAtDot isTerminal ] thenCollect: [ :each | each symbolAtDot ]).
	^ JEFailure atPosition: column number expectedSymbols: expectedSymbols asArray