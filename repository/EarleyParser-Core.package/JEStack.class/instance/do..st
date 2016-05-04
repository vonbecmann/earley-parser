enumerating
do: aBlock
	| current |
	current := firstLink.
	[ current isEmpty ]
		whileFalse: [ 
			aBlock value: current value.
			current := current nextLink ]