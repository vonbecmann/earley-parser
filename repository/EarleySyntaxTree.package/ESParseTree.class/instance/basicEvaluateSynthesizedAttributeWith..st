private
basicEvaluateSynthesizedAttributeWith: ruleAndActionDict
	" left to right depth first evaluation in post order "

	| stack |
	stack := SinglyLinkedStack new.
	tree
		depthVisitWithPostAction: [ :node | 
			node model isTerminal
				ifTrue: [ stack push: node model reason ]
				ifFalse: [ (ruleAndActionDict at: node model reason ifAbsent: nil)
						ifNotNil: [ :action | 
							stack
								push:
									(action
										value:
											(node children size = 1
												ifTrue: [ stack pop ]
												ifFalse: [ | arguments |
													arguments := SinglyLinkedList new.
													node children size timesRepeat: [ arguments addFirst: stack pop ].
													arguments asArray ])) ] ] ].
	self assert: stack size = 1.
	^ stack pop