public
forestStartingAt: aNode
	| forest derivationStack |
	forest := OrderedCollection new.
	derivationStack := JEStack new.
	derivationStack
		push:
			{(JEStack new
				push: aNode;
				yourself).
			(OrderedCollection new)}.
	[ derivationStack isEmpty ]
		whileFalse: [ 
			| derivation stack tree |
			derivation := derivationStack pop.
			stack := derivation first.
			tree := derivation second.
			[ stack isEmpty ]
				whileFalse: [ 
					| currentNode nodeEdges |
					currentNode := stack pop.
					nodeEdges := self edgesForTarget: currentNode.
					tree add: currentNode.
					nodeEdges isEmpty
						ifFalse: [ 
							nodeEdges size = 1
								ifTrue: [ 
									| nodeEdge |
									nodeEdge := nodeEdges first.
									nodeEdge sourceNodes reverseDo: [ :eachNode | stack push: eachNode ] ]
								ifFalse: [ 
									nodeEdges
										do: [ :each | 
											| newStack newTree |
											newStack := stack copy.
											newTree := tree copy.
											each sourceNodes reverseDo: [ :eachNode | newStack push: eachNode ].
											derivationStack
												push:
													{newStack.
													newTree} ].
									stack removeAll.
									tree removeAll ] ] ].
			tree isEmpty
				ifFalse: [ forest add: tree ] ].
	^ forest