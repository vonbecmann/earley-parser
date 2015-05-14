comparing
= anObject
	self class = anObject class
		ifFalse: [ ^ false ].
	self word = anObject word
		ifFalse: [ ^ false ].
	self terminal = anObject terminal
		ifFalse: [ ^ false ].
	self start = anObject start
		ifFalse: [ ^ false ].
	self end = anObject end
		ifFalse: [ ^ false ].
	^ true