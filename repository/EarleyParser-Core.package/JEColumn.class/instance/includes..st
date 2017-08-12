testing
includes: anItem
	"Answer whether an Item is present.
	Optimize for efficiency.
	itemsByKey anySatisfy: [ :each | each equals: anItem ]."

	(itemsByKey at: anItem firstKey ifAbsent: nil)
		ifNotNil:
			[ :dict | 
				(dict at: anItem secondKey ifAbsent: nil) 
					ifNotNil: [ :found | ^ found equals: anItem ] ].
	^ false