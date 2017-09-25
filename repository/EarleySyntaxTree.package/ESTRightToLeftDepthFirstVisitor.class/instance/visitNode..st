visiting
visitNode: aGivenTreeNode
	| visitStack |
	visitStack := SinglyLinkedStack with: { aGivenTreeNode. false }.
	[ visitStack isEmpty ]
		whileFalse: [ 
			| element node visited |
			element := visitStack top.
			node := element first.
			visited := element second.
			visited
				ifTrue: 
					[	visitStack pop.
						postOrderBlock ifNotNil: [ postOrderBlock value: node ] ]
				ifFalse: 
					[	element at: 2 put: true.
						preOrderBlock ifNotNil: [ preOrderBlock value: node ].
						node children do: [ :child | visitStack push: { child. false. } ] ] ]