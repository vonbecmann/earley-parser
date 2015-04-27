private
forest: forest stack: stack nodes: visitedNodes edges: visitedEdges
	[ stack isEmpty ]
		whileFalse: [ 
			| currentNode nodeEdges |
			currentNode := stack pop.
			nodeEdges := ((self edgesFor: currentNode) difference: visitedEdges) asOrderedCollection.
			forest add: currentNode.
			visitedNodes add: currentNode.
			nodeEdges isEmpty
				ifFalse: [ 
					nodeEdges size = 1
						ifTrue: [ 
							| nodeEdge |
							nodeEdge := nodeEdges first.
							visitedEdges add: nodeEdge.
							(nodeEdge nodes difference: visitedNodes) asOrderedCollection sort
								reverseDo: [ :eachNode | stack push: eachNode ] ]
						ifFalse: [ 
							nodeEdges
								do: [ :each | 
									| newStack |
									newStack := stack copy.
									visitedEdges add: each.
									(each nodes difference: visitedNodes) asOrderedCollection sort
										reverseDo: [ :eachNode | newStack push: eachNode ].
									self
										forest: forest
										stack: newStack
										nodes: visitedNodes copy
										edges: visitedEdges copy ] ] ] ]