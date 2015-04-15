enumerating
do: aBlock
	| aLink |
	aLink := firstLink.
	[ aLink isNil ]
		whileFalse: [ 
			aBlock value: aLink value.
			aLink := aLink nextLink ]