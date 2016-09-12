accessing
like: anItem
	^ itemsByKey detect: [ :each | each equals: anItem ] ifNone: [ nil ]