comparing
= anItem
	self class == anItem class
		ifFalse: [ ^ false ].
	startChart = anItem startChart
		ifFalse: [ ^ false ].
	dottedRule = anItem rule
		ifFalse: [ ^ false ].
	endChart = anItem endChart
		ifFalse: [ ^ false ].
	^ true