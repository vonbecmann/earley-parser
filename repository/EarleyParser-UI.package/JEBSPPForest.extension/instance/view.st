*EarleyParser-UI
view
	" returns a roassal view of myself"

	| nodes familyNodes associations b |
	nodes := SinglyLinkedList new.
	familyNodes := SinglyLinkedList new.
	associations := SinglyLinkedList new.
	JEDepthFirstVisitor new 
		preOrderNodeBlock: [ :packed | 
			nodes add: packed.
			associations addAll: (packed children collect: [ :family | packed -> family ]) ];
		preOrderFamilyBlock: [ :family | 
			familyNodes add: family.
			associations addAll: (family children collect: [ :packed | family -> packed ]) ];
		visit: root.
	
	b := RTMondrian new.
	b shape rectangle withTextAbove.
	b nodes: nodes.
	b shape circle
		withBorder;
		withTextAbove.
	b nodes: familyNodes.
	b shape arrowedLine.
	b edges useAssociations: associations.
	b layout tree.
	b build.
	^ b view