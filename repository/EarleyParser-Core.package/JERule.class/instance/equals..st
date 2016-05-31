comparing
equals: anUserRule
	head = anUserRule head
		ifFalse: [ ^ false ].
	body size == anUserRule body size
		ifFalse: [ ^ false ].
	body
		with: anUserRule body
		do: [ :first :second | 
			first = second
				ifFalse: [ ^ false ] ].
	^ true