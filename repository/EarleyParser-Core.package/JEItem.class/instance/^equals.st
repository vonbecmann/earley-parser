comparing
= anItem
	dotIndex = anItem dotIndex
		ifFalse: [ ^ false ].
	chart = anItem chart
		ifFalse: [ ^ false ].
	rule = anItem rule
		ifFalse: [ ^ false ].
	^ true