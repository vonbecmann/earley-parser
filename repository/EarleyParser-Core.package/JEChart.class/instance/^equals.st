comparing
= aChart
	self class == aChart class
		ifFalse: [ ^ false ].
	number = aChart number
		ifFalse: [ ^ false ].
	^ true