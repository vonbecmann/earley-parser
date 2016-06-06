comparing
= anObject
	self == anObject
		ifTrue: [ ^ true ].
	self class == anObject class
		ifFalse: [ ^ false ].
	targetNode == anObject targetNode
		ifFalse: [ ^ false ].
	sourceNodes size = anObject sourceNodes size
		ifFalse: [ ^ false ].
	sourceNodes
		with: anObject sourceNodes
		do: [ :first :second | 
			first == second
				ifFalse: [ ^ false ] ].
	^ true