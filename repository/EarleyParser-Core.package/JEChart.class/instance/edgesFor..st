accessing
edgesFor: anItem
	^ edges select: [ :each | each from = anItem ]