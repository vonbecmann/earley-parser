comparing
= aChart
	self == aChart
		ifTrue: [ ^ true ].
	self class == aChart class
		ifFalse: [ ^ false ].
	number == aChart number
		ifFalse: [ ^ false ].
	^ true