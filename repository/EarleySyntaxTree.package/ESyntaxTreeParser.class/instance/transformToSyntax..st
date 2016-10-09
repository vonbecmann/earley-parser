private operations
transformToSyntax: flattenTree
	| stack builder |
	stack := SinglyLinkedStack new.
	builder := ESIdentityTreeBuilder new.
	flattenTree
		depthVisitWithPostAction: [ :node | 
			node model class == JEDottedItem
				ifTrue: 
					[	| nonterminalNode |
						nonterminalNode := ESSyntaxNode 
													symbol: node model rule head 
													reason: node model rule asDefined
													start: node model startChart number
													end: node model endChart number.
						node children isEmpty
							ifTrue: [ builder addNode: nonterminalNode. ]
							ifFalse: 
								[	| newChildren |
									newChildren := SinglyLinkedStack new.
									node children size timesRepeat: [ newChildren push: stack pop ].
									builder 
										addNode: nonterminalNode  
										withChildren: newChildren asArray ].
						stack push: nonterminalNode ]
				ifFalse: 
					[ node model class == JETerminalItem
						ifTrue: 
							[ stack 
								push:
									(ESSyntaxNode 
										symbol: node model terminal
										reason: node model word
										start: node model startChart number
										end: node model endChart number) ] ] ].
	builder root: stack pop.
	self assert: stack isEmpty.
	^ builder build