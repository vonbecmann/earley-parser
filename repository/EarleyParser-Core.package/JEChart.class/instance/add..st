adding
add: anItem
	(self includes: anItem)
		ifFalse: [ 
			(itemsByChart at: anItem chart) add: anItem.
			items addLast: anItem ].
	^ anItem