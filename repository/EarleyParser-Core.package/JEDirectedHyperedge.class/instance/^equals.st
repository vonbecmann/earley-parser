comparing
= anObject
	self == anObject
		ifTrue: [ ^ true ].
	self class == anObject class
		ifFalse: [ ^ false ].
	self targetNode == anObject targetNode
		ifFalse: [ ^ false ].
	self sourceNodes size = anObject sourceNodes size
		ifFalse: [ ^ false ].
	self sourceNodes
		with: anObject sourceNodes
		do: [ :first :second | 
			first == second
				ifFalse: [ ^ false ] ].
	^ true