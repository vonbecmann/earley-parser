comparing
equals: anUserRule
	self head = anUserRule head
		ifFalse: [ ^ false ].
	self body size == anUserRule body size
		ifFalse: [ ^ false ].
	self body
		with: anUserRule body
		do: [ :first :second | 
			first = second
				ifFalse: [ ^ false ] ].
	^ true