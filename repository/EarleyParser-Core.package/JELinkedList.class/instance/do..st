enumerating
do: aBlock
	| current |
	current := firstLink.
	[ current isNil ]
		whileFalse: [ 
			aBlock value: current value.
			current := current nextLink ]