comparing
= anObject
	self class = anObject class
		ifFalse: [ ^ false ].
	self word = anObject word
		ifFalse: [ ^ false ].
	self terminal = anObject terminal
		ifFalse: [ ^ false ].
	self startChart = anObject startChart
		ifFalse: [ ^ false ].
	self endChart = anObject endChart
		ifFalse: [ ^ false ].
	^ true