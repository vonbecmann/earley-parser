copying
postCopy
	| link |
	super postCopy.
	firstLink
		ifNotNil: [ 
			link := firstLink := firstLink copy.
			[ link nextLink isNil ] whileFalse: [ link nextLink: (link := link nextLink copy) ].
			lastLink := link ]