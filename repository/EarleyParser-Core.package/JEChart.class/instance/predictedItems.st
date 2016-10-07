accessing
predictedItems
	^ (itemsByKey select: [ :each | each isPredicted ]) values