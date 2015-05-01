private
forest: forest stack: stack
	[ stack isEmpty ]
		whileFalse: [ 
			| currentNode nodeEdges |
			currentNode := stack pop.
			nodeEdges := self edgesForTarget: currentNode.
			forest add: currentNode.
			nodeEdges isEmpty
				ifFalse: [ 
					nodeEdges size = 1
						ifTrue: [ 
							| nodeEdge |
							nodeEdge := nodeEdges first.
							nodeEdge sourceNodes reverseDo: [ :eachNode | stack push: eachNode ] ]
						ifFalse: [ 
							| allNewForest |
							allNewForest := OrderedCollection new.
							nodeEdges
								do: [ :each | 
									| newStack newForest |
									newStack := stack copy.
									newForest := forest copy.
									each sourceNodes reverseDo: [ :eachNode | newStack push: eachNode ].
									self forest: newForest stack: newStack.
									(newForest anySatisfy: [ :elem | elem isCollection ])
										ifTrue: [ newForest do: [ :elem | allNewForest add: elem ] ]
										ifFalse: [ allNewForest add: newForest ] ].
							[ stack isEmpty ] whileFalse: [ stack pop ].
							forest removeAll.
							forest addAll: allNewForest ] ] ]