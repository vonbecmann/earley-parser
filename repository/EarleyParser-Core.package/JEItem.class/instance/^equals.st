comparing
= anItem
	self class == anItem class
		ifFalse: [ ^ false ].
	chart = anItem chart
		ifFalse: [ ^ false ].
	dottedRule = anItem rule
		ifFalse: [ ^ false ].
	^ true