comparing
= aRule
	left = aRule left
		ifFalse: [ ^ false ].
	right = aRule right
		ifFalse: [ ^ false ].
	^ true