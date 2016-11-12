*EarleySyntaxTree-UI
view
	" returns a roassal view of myself"

	| nodes associations b |
	nodes := SinglyLinkedList new.
	associations := SinglyLinkedList new.
	ESTDepthFirstVisitor new
		preOrderBlock: [ :node | 
			nodes add: node.
			associations addAll: (node children collect: [ :child | node -> child ]) ];
		visit: self.
	b := RTMondrian new.
	b shape rectangle withTextAbove.
	b nodes: nodes.
	b shape arrowedLine.
	b edges useAssociations: associations.
	b layout tree.
	b build.
	^ b view