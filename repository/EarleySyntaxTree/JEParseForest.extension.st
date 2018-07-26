Extension { #name : #JEParseForest }

{ #category : #'*EarleySyntaxTree' }
JEParseForest >> extractSingleParseTree [
	"the forest has one binary tree, so we need to extract it from the forest. 
	 but flatten as the production rules and using syntax nodes."

	| stack |
	stack := SinglyLinkedStack new.
	JETreeDepthFirstVisitor new
		postOrderNodeBlock: [ :node | 
			node model isTerminal
				ifTrue: [ 
					stack
						push:
							(ESTreeNode
								model:
									(ESSyntaxNode
										symbol: node model terminal
										reason: node model word
										start: node model start number
										end: node model end number)) ]
				ifFalse: [ 
					node model isFinal
						ifTrue: [ 
							stack
								push:
									(ESTreeNode
										model:
											(ESSyntaxNode
												symbol: node model head
												reason: (grammar productionRuleAt: node model rule)
												start: node model start number
												end: node model end number)
										children:
											(node families isEmpty
												ifTrue: [ #() ]
												ifFalse: [ stack popReversed: node model dottedRule body size ])) ] ] ];
		visit: syntaxForest.
	self assert: [ stack size = 1 ].
	^ ESParseTree given: (ESTree rootNode: stack pop) of: grammar
]
