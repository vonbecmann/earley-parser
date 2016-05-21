comparing
= aRule
	self == aRule
		ifTrue: [ ^ true ].
	self class == aRule class
		ifFalse: [ ^ false ].
	self head = aRule head
		ifFalse: [ ^ false ].
	self body size == aRule body size
		ifFalse: [ ^ false ].
	self body
		with: aRule body
		do: [ :first :second | 
			first = second
				ifFalse: [ ^ false ] ].
	^ true