*EarleyUI
view
	" returns a roassal view of myself"

	| nodes familyNodes associations b |
	nodes := JELinkedList new.
	familyNodes := JELinkedList new.
	associations := JELinkedList new.
	self
		depthVisitPreNode: [ :packed | 
			nodes add: packed.
			associations addAll: (packed families collect: [ :family | packed -> family ]) ]
		postNode: nil
		preFamily: [ :family | 
			familyNodes add: family.
			associations addAll: (family members collect: [ :packed | family -> packed ]) ]
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