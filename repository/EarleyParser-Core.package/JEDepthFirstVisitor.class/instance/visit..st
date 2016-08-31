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
					element acceptPostVisitor: self ]
				ifFalse: [ 
					visited at: element put: true.
					element acceptPreVisitor: self.
					element children reverseDo: [ :child | visitStack push: child ] ] ]