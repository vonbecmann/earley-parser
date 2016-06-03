comparing
= aChart
	self == aChart
		ifTrue: [ ^ true ].
	^ self class == aChart class and: [ number == aChart number ]