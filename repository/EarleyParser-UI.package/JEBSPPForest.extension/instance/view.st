*EarleyParser-UI
view
	" returns a roassal view of myself"

	| nodes familyNodes associations b |
	nodes := SinglyLinkedList new.
	familyNodes := SinglyLinkedList new.
	associations := SinglyLinkedList new.
	self
		depthVisitPreNode: [ :packed | 
			nodes add: packed.
			associations addAll: (packed children collect: [ :family | packed -> family ]) ]
		postNode: nil
		preFamily: [ :family | 
			familyNodes add: family.
			associations addAll: (family children collect: [ :packed | family -> packed ]) ]
		postFamily: nil.
	
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