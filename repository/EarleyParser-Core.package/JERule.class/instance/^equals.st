comparing
= aRule
	head = aRule head
		ifFalse: [ ^ false ].
	body = aRule body
		ifFalse: [ ^ false ].
	^ true