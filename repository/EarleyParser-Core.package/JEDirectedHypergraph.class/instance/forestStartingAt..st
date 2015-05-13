public
forestStartingAt: aNode
	| forest derivationStack |
	forest := OrderedCollection new.
	derivationStack := JEStack
		with:
			{	(JEStack with: aNode).
				(JELinkedList new) }.
	[ derivationStack isEmpty ]
		whileFalse: [ 
			| derivation stack tree |
			derivation := derivationStack pop.
			stack := derivation first.
			tree := derivation second.
			[ stack isEmpty ]
				whileFalse: [ 
					| currentNode sourceNodes |
					currentNode := stack pop.
					sourceNodes := self sourceNodesAt: currentNode.
					tree add: currentNode.
					sourceNodes isEmpty
						ifFalse: [ 
							sourceNodes size = 1
								ifTrue: [ sourceNodes first reverseDo: [ :eachNode | stack push: eachNode ] ]
								ifFalse: [ 
									sourceNodes
										do: [ :each | 
											| newStack |
											newStack := stack copy.
											each reverseDo: [ :eachNode | newStack push: eachNode ].
											derivationStack
												push:
													{newStack.
													(tree copy)} ].
									stack removeAll.
									tree removeAll ] ] ].
			tree isEmpty
				ifFalse: [ forest add: tree asArray ] ].
	^ forest