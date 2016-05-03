comparing
equals: anItem
	startChart = anItem startChart
		ifFalse: [ ^ false ].
	dottedRule = anItem dottedRule
		ifFalse: [ ^ false ].
	^ true