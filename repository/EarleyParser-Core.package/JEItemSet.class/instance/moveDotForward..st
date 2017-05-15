adding
moveDotForward: previousItem
	" Optimize for efficiency. 
		if the item already exits 
			then return it 
			else add it last"

	(itemsByKey at: previousItem dottedRule moveDotForward ifAbsent: nil)
		ifNotNil: [ :dict | 
			(dict at: previousItem start ifAbsent: nil)
				ifNotNil: [ :found | ^ found ] ].

	^ self basicAdd: previousItem moveDotForward