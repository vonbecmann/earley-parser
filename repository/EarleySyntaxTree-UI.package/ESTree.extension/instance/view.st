*EarleySyntaxTree-UI
view
	" returns a roassal view of myself"

	| nodes associations b |
	nodes := SinglyLinkedList new.
	associations := SinglyLinkedList new.
	self
		depthVisitWithPreAction: 
			[ 	:node | 
				nodes add: node.
				associations addAll: (node children collect: [ :child | node -> child ]) ].
	b := RTMondrian new.
	b shape rectangle withTextAbove.
	b nodes: nodes.
	b shape arrowedLine.
	b edges useAssociations: associations.
	b layout tree.
	b build.
	^ b view