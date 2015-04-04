adding
add: anItem
	(self includes: anItem)
		ifFalse: [ 
			(itemsByChart at: anItem startChart) add: anItem.
			items addLast: anItem.
			anItem chart: self ].
	^ anItem