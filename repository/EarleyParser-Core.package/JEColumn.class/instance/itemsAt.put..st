private
itemsAt: key put: anItem
	(itemsByKey at: key first ifAbsent: nil)
		ifNil: [ 
			itemsByKey
				at: key first
				put:
					(IdentityDictionary new
						at: key second put: anItem;
						yourself) ]
		ifNotNil: [ :dict | dict at: key second put: anItem ]