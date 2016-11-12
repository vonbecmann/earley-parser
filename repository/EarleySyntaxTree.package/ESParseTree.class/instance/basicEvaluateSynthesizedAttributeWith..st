private
basicEvaluateSynthesizedAttributeWith: ruleToActionDict
	" left to right depth first evaluation in post order "

	| stack |
	stack := SinglyLinkedStack new.
	ESTDepthFirstVisitor new 
		postOrderBlock: [ :node | 
			node model isTerminal
				ifTrue: [ stack push: node model reason ]
				ifFalse: [ 
					(ruleToActionDict at: node model reason ifAbsent: nil)
						ifNotNil: [ :action | 
							stack
								push:
									(action
										valueWithArguments:
											(node children isEmpty
												ifTrue: [ #() ]
												ifFalse: [ 
													node children size = 1
														ifTrue: [ {stack pop} ]
														ifFalse: [ | arguments |
															arguments := SinglyLinkedStack new.
															node children size timesRepeat: [ arguments push: stack pop ].
															{arguments asArray} ] ])) ] ] ]; 
		visit: tree.
	self assert: stack size = 1.
	^ stack pop