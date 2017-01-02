comparing
= itemSet
	self == itemSet
		ifTrue: [ ^ true ].
	^ self class == itemSet class and: [ number == itemSet number ]