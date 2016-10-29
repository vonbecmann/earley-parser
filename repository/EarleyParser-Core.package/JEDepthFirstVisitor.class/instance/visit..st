visiting
visit: rootNode
	| visitStack visited |
	visitStack := SinglyLinkedStack with: rootNode.
	visited := IdentityDictionary new.
	[ visitStack isEmpty ]
		whileFalse: [ 
			| element |
			element := visitStack top.
			(visited at: element ifAbsent: false)
				ifTrue: [ 
					visitStack pop.
					element acceptPostOrderVisitor: self ]
				ifFalse: [ 
					visited at: element put: true.
					element acceptPreOrderVisitor: self.
					element children reverseDo: [ :child | visitStack push: child ] ] ]