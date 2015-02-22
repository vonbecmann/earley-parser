comparing
= aRule
	body size = aRule body size
		ifFalse: [ ^ false ].
	body
		with: aRule body
		do: [ :first :second | 
			first = second
				ifFalse: [ ^ false ] ].
	head = aRule head
		ifFalse: [ ^ false ].
	^ true