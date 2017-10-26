visiting
visitRoot: aPackedNode
	| visitStack visited processed |
	visitStack := SinglyLinkedStack with: aPackedNode.
	visited := IdentityDictionary new.
	processed := IdentitySet new.
	[ visitStack isEmpty ]
		whileFalse: [ 
			| element |
			element := visitStack top.
			(visited at: element ifAbsent: false)
				ifTrue: [ 
					visitStack pop.
					(processed includes: element) 
						ifFalse: [
							element acceptPostOrderVisitor: self.
							processed add: element ] ]
				ifFalse: [ 
					visited at: element put: true.
					element acceptPreOrderVisitor: self.
					element children reverseDo: [ :child | visitStack push: child ] ] ]