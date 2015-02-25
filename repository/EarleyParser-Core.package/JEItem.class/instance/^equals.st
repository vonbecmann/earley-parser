comparing
= anItem
	chart = anItem chart
		ifFalse: [ ^ false ].
	rule = anItem rule
		ifFalse: [ ^ false ].
	^ true