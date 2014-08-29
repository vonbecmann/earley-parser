comparing
= anItem
	dotPosition = anItem dotPosition
		ifFalse: [ ^ false ].
	chart = anItem chart
		ifFalse: [ ^ false ].
	rule = anItem rule
		ifFalse: [ ^ false ].
	^ true