private operations
transformToSyntax: flattenTree
	| stack builder |
	stack := SinglyLinkedStack new.
	builder := ESIdentityTreeBuilder new.
	flattenTree
		depthVisitPreNode: nil
		postNode: [ :node | 
			node model class == JEDottedItem
				ifTrue: 
					[	| nonterminalNode |
						nonterminalNode := ESNonterminalNode 
													rule: node model rule asDefined
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
									(ESTerminalNode
										terminal: node model terminal
										word: node model word
										start: node model startChart number
										end: node model endChart number) ] ] ].
	builder root: stack pop.
	self assert: stack isEmpty.
	^ builder build