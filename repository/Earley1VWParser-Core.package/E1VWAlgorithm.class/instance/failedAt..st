error handling
failedAt: chart
	| expectedSymbols |
	expectedSymbols := Set new.
	expectedSymbols
		addAll: (chart activeItems collect: [ :each | each symbolAtDot ]);
		addAll: (chart predictedItems 
							reject: [ :each | each rule isRepresentation ] thenCollect: [ :each | each symbolAtDot ]).
	^ JEFailure atPosition: chart number expectedSymbols: expectedSymbols asArray