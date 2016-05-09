testing
includes: anItem
	^ (self itemsAt: anItem startChart) anySatisfy: [ :each | each equals: anItem ]