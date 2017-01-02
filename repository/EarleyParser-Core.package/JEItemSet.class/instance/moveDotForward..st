adding
moveDotForward: previousItem
	" Optimize for efficiency. 
		if the item already exits 
			then return it 
			else add it last"

	| nextItem |
	(itemsByKey at: previousItem dottedRule moveDotForward ifAbsent: nil)
		ifNotNil: 
			[ :dict | 
				(dict at: previousItem start ifAbsent: nil) 
					ifNotNil: [ :found | ^ found ] ].
	nextItem := previousItem moveDotForward.
	itemsByKey 
		at: nextItem key first 
		add: (Association basicNew key: nextItem key second value: nextItem).
	^ self basicAdd: nextItem