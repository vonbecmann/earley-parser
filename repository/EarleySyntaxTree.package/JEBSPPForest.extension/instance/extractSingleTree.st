*EarleySyntaxTree
extractSingleTree
	"the forest has one tree, so we need to extract it from the forest."

	| stack |
	stack := SinglyLinkedStack new.
	JEDepthFirstVisitor new
		postOrderNodeBlock: [ :node | 
			| treeNode |
			treeNode := ESTreeNode model: node model.
			node families isEmpty
				ifFalse: [ | newChildren |
					newChildren := SinglyLinkedStack new.
					node families first size
						timesRepeat: [ newChildren push: stack pop ].
					treeNode children: newChildren asArray ].
			stack push: treeNode ];
		visit: self.
	self assert: [ stack size = 1 ].
	^ ESTree rootNode: stack pop