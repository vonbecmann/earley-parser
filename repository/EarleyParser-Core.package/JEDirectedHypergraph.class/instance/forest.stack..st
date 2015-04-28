private
forest: forest stack: stack
	[ stack isEmpty ]
		whileFalse: [ 
			| currentNode nodeEdges |
			currentNode := stack pop.
			nodeEdges := (self edgesForTarget: currentNode) asOrderedCollection.
			forest add: currentNode.
			nodeEdges isEmpty
				ifFalse: [ 
					nodeEdges size = 1
						ifTrue: [ 
							| nodeEdge |
							nodeEdge := nodeEdges first.
							nodeEdge sourceNodes asOrderedCollection sort reverseDo: [ :eachNode | stack push: eachNode ] ]
						ifFalse: [ 
							nodeEdges
								do: [ :each | 
									| newStack |
									newStack := stack copy.
									each sourceNodes asOrderedCollection sort reverseDo: [ :eachNode | newStack push: eachNode ].
									self forest: forest stack: newStack ] ] ] ]