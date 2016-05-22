comparing
= aPair
	self == aPair
		ifTrue: [ ^ true ].
	self class == aPair class
		ifFalse: [ ^ false ].
	^ self first = aPair first and: [ self second = aPair second ]