comparing
= anObject
	self == anObject
		ifTrue: [ ^ true ].
	self class == anObject class
		ifFalse: [ ^ false ].
	self startChart = anObject startChart
		ifFalse: [ ^ false ].
	self endChart = anObject endChart
		ifFalse: [ ^ false ].
	self terminal = anObject terminal
		ifFalse: [ ^ false ].
	^ true