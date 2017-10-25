private operations
extractTreeFrom: aBSPPForest
	"the forest has one tree, so we need to extract it from the forest."

	| stack syntaxTree |
	stack := SinglyLinkedStack new.
	JEDepthFirstVisitor new
		postOrderNodeBlock: [ :node | 
			| treeNode |
			treeNode := ESTreeNode model: node model.
			node families isEmpty
				ifFalse: [ | newChildren |
					newChildren := SinglyLinkedStack new.
					node families first size timesRepeat: [ newChildren push: stack pop ].
					treeNode children: newChildren asArray ].
			stack push: treeNode ];
		visit: aBSPPForest.
	self assert: [ stack size = 1 ].
	syntaxTree := ESTree rootNode: stack pop.
	self assert: [ stack isEmpty ].
	^ syntaxTree