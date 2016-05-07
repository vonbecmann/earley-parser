private
numberOfTreesFrom: aNode
	"depth visit from a node. return the number of trees from a given node"

	| derivationStack numberOfTreeExp |
	numberOfTreeExp := JELinkedList new.
	derivationStack := JEStack
		with:
			{(JEStack with: aNode).
			numberOfTreeExp}.
	[ derivationStack isEmpty ]
		whileFalse: [ 
			| derivation stack exp |
			derivation := derivationStack pop.
			stack := derivation first.
			exp := derivation second.
			[ stack isEmpty ]
				whileFalse: [ 
					| currentNode sourceNodes |
					currentNode := stack pop.
					sourceNodes := sourceNodesByTarget at: currentNode.
					sourceNodes isEmpty
						ifTrue: [ exp add: 1 ]
						ifFalse: [ 
							| sumArgs |
							sumArgs := JELinkedList new.
							exp add: (JELinkedList with: #sum with: sumArgs).
							sourceNodes
								do: [ :each | 
									each isEmpty
										ifTrue: [ sumArgs add: 1 ]
										ifFalse: [ 
											| newStack productArgs |
											newStack := stack copy.
											productArgs := JELinkedList new.
											sumArgs add: (JELinkedList with: #product with: productArgs).
											each reverseDo: [ :eachNode | newStack push: eachNode ].
											derivationStack
												push:
													{newStack.
													productArgs} ] ].
							stack removeAll ] ] ].
	^ self eval: numberOfTreeExp