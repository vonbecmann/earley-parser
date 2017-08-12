adding
add: anItem
	" Optimize for efficiency. 
		if the item already exits 
			then return it 
			else add it last"

	(itemsByKey at: anItem firstKey ifAbsent: nil)
		ifNotNil: 
			[ :dict | 
				(dict at: anItem secondKey ifAbsent: nil) 
					ifNotNil: [ :found | ^ found ] ].

	^ self basicAdd: anItem