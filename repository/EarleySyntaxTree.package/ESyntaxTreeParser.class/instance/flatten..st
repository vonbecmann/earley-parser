private operations
flatten: extractedTree
	| builder |
	builder := ESIdentityTreeBuilder new.
	builder root: extractedTree root.
	extractedTree
		depthVisitPreNode: [ :node | 
			node model isFinal
				ifTrue: [ 
					(node children allSatisfy: [ :each | each model isFinal ])
						ifTrue: [ 
							builder 
								addNode: node model 
								withChildren: (node children collect: [ :each | each model ]) ]
						ifFalse: [ 
							| children newChildren |
							children := SinglyLinkedStack withAll: node children.
							newChildren := SinglyLinkedStack new.
							[ children isEmpty ]
								whileFalse: [ 
									| child |
									child := children pop.
									child model isFinal
										ifTrue: [ newChildren push: child model ]
										ifFalse: [ child children do: [ :each | children push: each ] ] ].
							builder 
								addNode: node model 
								withChildren: newChildren asArray ] ] ]
		postNode: nil.
	^ builder build