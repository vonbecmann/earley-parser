private
itemsByKeyPut: anItem
	(itemsByKey at: anItem firstKey ifAbsent: nil)
		ifNil: [ 
			itemsByKey
				at: anItem firstKey 
				put:
					(IdentityDictionary new
						at: anItem secondKey put: anItem;
						yourself) ]
		ifNotNil: [ :dict | dict at: anItem secondKey put: anItem ]