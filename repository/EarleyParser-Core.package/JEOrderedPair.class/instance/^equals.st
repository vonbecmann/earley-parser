comparing
= aPair
	self == aPair
		ifTrue: [ ^ true ].
	self class == aPair class
		ifFalse: [ ^ false ].
	^ first = aPair first and: [ second = aPair second ]