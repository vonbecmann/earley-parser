comparing
= anItem
	chart = anItem chart
		ifFalse: [ ^ false ].
	dotIndex = anItem dotIndex
		ifFalse: [ ^ false ].
	rule = anItem rule
		ifFalse: [ ^ false ].
	^ true