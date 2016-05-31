comparing
= anObject
	self class == anObject class
		ifFalse: [ ^ false ].
	members size == anObject members size
		ifFalse: [ ^ false ].
	members
		with: anObject members
		do: [ :first :second | 
			first == second
				ifFalse: [ ^ false ] ].
	^ true