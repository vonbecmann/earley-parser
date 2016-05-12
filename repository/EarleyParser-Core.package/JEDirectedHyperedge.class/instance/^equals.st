comparing
= anObject
	"label is not part of my identity."

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