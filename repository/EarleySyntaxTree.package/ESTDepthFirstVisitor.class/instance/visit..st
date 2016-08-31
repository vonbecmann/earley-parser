visiting
visit: rootNode
	| visited visitStack |
	visited := IdentityDictionary new.
	visitStack := SinglyLinkedStack with: rootNode.
	[ visitStack isEmpty ]
		whileFalse: [ 
			| node |
			node := visitStack top.
			(visited at: node ifAbsent: false)
				ifTrue: [ 
					visitStack pop.
					postNodeBlock ifNotNil: [ postNodeBlock value: node ] ]
				ifFalse: [ 
					visited at: node put: true.
					preNodeBlock ifNotNil: [ preNodeBlock value: node ].
					node children reversed do: [ :child | visitStack push: child ] ] ]