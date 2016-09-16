adding
moveDotForward: previousItem
	" Optimize for efficiency. 
		if the item already exits 
			then return it 
			else add it last"

	| nextItem |
	(itemsByKey at: previousItem dottedRule moveDotForward key ifAbsent: nil)
		ifNotNil: [ :dict | (dict at: previousItem startChart number ifAbsent: nil) ifNotNil: [ :found | ^ found ] ].
	nextItem := previousItem moveDotForward.
	itemsByKey at: nextItem key first add: nextItem key second -> nextItem.
	^ self basicAdd: nextItem