adding
add: anItem
	" Optimize for efficiency. 
		if the item doesn't exist then add it last.
		this is a predicted item "

	(itemsByKey at: anItem firstKey ifAbsent: nil)
		ifNil: [ self basicAdd: anItem ]
		ifNotNil:
			[ :dict | 
				(dict at: anItem secondKey ifAbsent: nil) 
					ifNil: [ self basicAdd: anItem ] ]