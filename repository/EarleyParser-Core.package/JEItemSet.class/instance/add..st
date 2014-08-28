adding
add: anItem
	(self includes: anItem)
		ifFalse: [ items add: anItem ].
	^ anItem