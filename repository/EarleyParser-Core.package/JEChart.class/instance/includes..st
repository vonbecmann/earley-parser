testing
includes: anItem
	^ itemsByKey anySatisfy: [ :each | each equals: anItem ]