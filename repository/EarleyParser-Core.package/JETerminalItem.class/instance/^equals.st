comparing
= anObject
	self == anObject
		ifTrue: [ ^ true ].
	self class == anObject class
		ifFalse: [ ^ false ].
	startChart = anObject startChart
		ifFalse: [ ^ false ].
	endChart = anObject endChart
		ifFalse: [ ^ false ].
	terminal = anObject terminal
		ifFalse: [ ^ false ].
	^ true