comparing
= anItem
	chart = anItem chart
		ifFalse: [ ^ false ].
	dottedRule = anItem rule
		ifFalse: [ ^ false ].
	^ true