adding
add: anItem
	(self includes: anItem)
		ifFalse: [ items addLast: anItem ].
	^ anItem