private operations
transformToSyntax: flattenTree
	| stack syntaxTree |
	stack := SinglyLinkedStack new.
	ESTDepthFirstVisitor new 
		postOrderBlock: [ :node | 
			 node model isTerminal 
					ifTrue: 
						[	stack
								push: (ESTreeNode model: 
											(ESSyntaxNode 
												symbol: node model terminal
												reason: node model word
												start: node model start number
												end: node model end number)) ] 
					ifFalse: 
						[	| nonterminalNode |
							nonterminalNode := (ESTreeNode model:
														(ESSyntaxNode 
															symbol: node model rule head 
															reason: node model rule asDefined
															start: node model start number
															end: node model end number)).
							node children isEmpty
								ifFalse: 
									[	| newChildren |
										newChildren := SinglyLinkedStack new.
										node children size timesRepeat: [ newChildren push: stack pop ].
										nonterminalNode children: newChildren asArray ].
							stack push: nonterminalNode ] ];
		visit: flattenTree.
		
	self assert: [ stack size = 1 ].
	syntaxTree := ESTree rootNode: stack pop.
	self assert: [ stack isEmpty ].
	^ syntaxTree