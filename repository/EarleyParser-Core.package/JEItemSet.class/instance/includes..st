testing
includes: anItem
	"Answer whether an Item is present.
	Optimize for efficiency.
	itemsByKey anySatisfy: [ :each | each equals: anItem ]."

	(itemsByKey at: anItem key first ifAbsent: nil)
		ifNotNil:
			[ :dict | 
				(dict at: anItem key second ifAbsent: nil) 
					ifNotNil: [ :found | ^ found equals: anItem ] ].
	^ false