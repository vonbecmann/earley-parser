Extension { #name : #JEParseForest }

{ #category : #'*EarleySyntaxTree' }
JEParseForest >> extractSingleParseTree [
	"the forest has one binary tree, so we need to extract it from the forest. 
	 but flatten as the production rules and using syntax nodes."

	| stack |
	stack := SinglyLinkedStack new.
	JETreeDepthFirstVisitor new
		postOrderNodeBlock: [ :node | 
			node isTerminal
				ifTrue: [ stack push: (ESTreeNode	model: node asSyntaxNode) ]
				ifFalse: [ 
					node isFinal
						ifTrue: [ 
							stack
								push:
									(ESTreeNode
										model: (node asSyntaxNodeOf: grammar)
										children: (stack popReversed: node dottedRule body size)) ] ] ];
		visit: syntaxForest.
	self assert: [ stack size = 1 ].
	^ ESParseTree given: (ESTree rootNode: stack pop) of: grammar
]
