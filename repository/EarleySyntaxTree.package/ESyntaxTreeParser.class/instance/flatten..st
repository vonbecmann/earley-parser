private operations
flatten: extractedTree
	| stack |
	stack := SinglyLinkedStack new.
	ESTDepthFirstVisitor new
		postOrderBlock: [ :node | 
			node model isFinal
				ifTrue: [ | finalNode |
					finalNode := ESTreeNode model: node model.
					node children isEmpty
						ifFalse: [ | newChildren |
							newChildren := SinglyLinkedStack new.
							node model dottedRule body size timesRepeat: [ newChildren push: stack pop ].
							finalNode children: newChildren asArray ].
					stack push: finalNode ] ];
		visit: extractedTree.
	self assert: [ stack size = 1 ].
	^ ESTree rootNode: stack pop