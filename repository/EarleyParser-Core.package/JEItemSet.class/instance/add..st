adding
add: anItem
	" Optimize for efficiency. 
		if the item already exits 
			then return it 
			else add it last"

	(itemsByKey at: anItem key first ifAbsent: nil)
		ifNotNil: 
			[ :dict | 
				(dict at: anItem key second ifAbsent: nil) 
					ifNotNil: [ :found | ^ found ] ].

	^ self basicAdd: anItem