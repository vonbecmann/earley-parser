comparing
equals: aJEUserRule
	self head = aJEUserRule head
		ifFalse: [ ^ false ].
	self body size = aJEUserRule body size
		ifFalse: [ ^ false ].
	self body
		with: aJEUserRule body
		do: [ :first :second | 
			first = second
				ifFalse: [ ^ false ] ].
	^ true