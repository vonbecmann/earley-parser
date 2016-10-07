accessing
activeItems
	^ (itemsByKey select: [ :each | each isActive ]) values