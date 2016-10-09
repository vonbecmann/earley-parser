visiting
visit: aGivenTreeNode
	| visited visitStack |
	visited := IdentityDictionary new.
	visitStack := SinglyLinkedStack with: aGivenTreeNode.
	[ visitStack isEmpty ]
		whileFalse: 
			[ 	| node |
				node := visitStack top.
				(visited at: node ifAbsent: false)
					ifTrue: 
						[	visitStack pop.
							postOrderBlock ifNotNil: [ postOrderBlock value: node ] ]
					ifFalse: 
						[	visited at: node put: true.
							preOrderBlock ifNotNil: [ preOrderBlock value: node ].
							node children reversed do: [ :child | visitStack push: child ] ] ]