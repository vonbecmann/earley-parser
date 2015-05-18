comparing
equals: anItem
	self class == anItem class
		ifFalse: [ ^ false ].
	startChart = anItem startChart
		ifFalse: [ ^ false ].
	dottedRule = anItem dottedRule
		ifFalse: [ ^ false ].
	^ true