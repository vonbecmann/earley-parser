Extension { #name : #JEParseForest }

{ #category : #'*EarleySyntaxTree' }
JEParseForest >> extractSingleParseTree [
	"the forest has one binary tree, so we need to extract it from the forest. 
	 but flatten as the production rules and using syntax nodes."

	| stack |
	stack := SinglyLinkedStack new.
	JEDepthFirstVisitor new
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
						ifTrue: [ | finalNode |
							finalNode := ESTreeNode
								model:
									(ESSyntaxNode
										symbol: node model head
										reason: (grammar productionRuleAt: node model rule)
										start: node model start number
										end: node model end number).
							node families isEmpty
								ifFalse: [ | newChildren |
									newChildren := Array new: node model dottedRule body size.
									node model dottedRule body size to: 1 by: -1 do: [ :i | newChildren at: i put: stack pop ].
									finalNode children: newChildren ].
							stack push: finalNode ] ] ];
		visit: syntaxTree.
	self assert: [ stack size = 1 ].
	^ ESParseTree given: (ESTree rootNode: stack pop) of: grammar
	
]
