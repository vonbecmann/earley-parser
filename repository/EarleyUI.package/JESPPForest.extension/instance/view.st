*EarleyUI
view
	" returns a roassal view of myself"

	| nodes familyNodes associations b visited queue |
	nodes := JELinkedList new.
	familyNodes := JELinkedList new.
	associations := JELinkedList new.
	visited := IdentityDictionary new.
	queue := JELinkedList with: root.
	visited at: root put: true.
	[ queue isEmpty ]
		whileFalse: [ | packed |
			packed := queue removeFirst.
			nodes add: packed.
			packed families
				do: [ :family | 
					familyNodes add: family.
					associations add: packed -> family.
					associations addAll: (family members collect: [ :each | family -> each ]).
					family members
						reject: [ :node | visited at: node ifAbsent: [ false ] ]
						thenDo: [ :node | 
							visited at: node put: true.
							queue addLast: node ] ] ].
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