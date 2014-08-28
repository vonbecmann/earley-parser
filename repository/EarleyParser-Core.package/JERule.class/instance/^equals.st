comparing
= aRule
	head = aRule head
		ifFalse: [ ^ false ].
	body size = aRule body size
		ifFalse: [ ^ false ].
	body
		with: aRule body
		do: [ :first :second | 
			first = second
				ifFalse: [ ^ false ] ].
	^ true