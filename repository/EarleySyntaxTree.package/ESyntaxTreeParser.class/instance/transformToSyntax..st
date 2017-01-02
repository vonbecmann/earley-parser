private operations
transformToSyntax: flattenTree
	| stack builder |
	stack := SinglyLinkedStack new.
	builder := ESIdentityTreeBuilder new.
	ESTDepthFirstVisitor new 
		postOrderBlock: [ :node | 
			 node model isTerminal 
					ifTrue: 
						[	stack
								push: (ESSyntaxNode 
											symbol: node model terminal
											reason: node model word
											start: node model start number
											end: node model end number) ] 
					ifFalse: 
						[	| nonterminalNode |
							nonterminalNode := ESSyntaxNode 
														symbol: node model rule head 
														reason: node model rule asDefined
														start: node model start number
														end: node model end number.
							node children isEmpty
								ifTrue: [ builder addNode: nonterminalNode. ]
								ifFalse: 
									[	| newChildren |
										newChildren := SinglyLinkedStack new.
										node children size timesRepeat: [ newChildren push: stack pop ].
										builder addNode: nonterminalNode withChildren: newChildren asArray ].
							stack push: nonterminalNode ] ];
		visit: flattenTree.
	builder root: stack pop.
	self assert: stack isEmpty.
	^ builder build