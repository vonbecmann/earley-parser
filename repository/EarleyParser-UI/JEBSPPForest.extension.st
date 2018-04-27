Extension { #name : #JEBSPPForest }

{ #category : #'*EarleyParser-UI' }
JEBSPPForest >> gtInspectorBrowserIn: composite [
	<gtInspectorPresentationOrder: 9>
	^ composite tree
		title: 'Browse';
		display: [ root ];
		children: [ :each | each children ];
		yourself
]

{ #category : #'*EarleyParser-UI' }
JEBSPPForest >> gtInspectorViewIn: composite [
	<gtInspectorPresentationOrder: 10>
	^ composite tree
		title: 'View';
		display: [ root ];
		children: [ :each | each children ];
		send: [ :each | self viewFor: each ];
		yourself
]

{ #category : #'*EarleyParser-UI' }
JEBSPPForest >> viewFor: aNode [
	" returns a roassal view of a given node"

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
		visitNode: aNode.
	b := RTMondrian new.
	b shape rectangle withTextAbove.
	b nodes: nodes asArray.
	b shape circle
		withBorder;
		withTextAbove.
	b nodes: familyNodes asArray.
	b shape arrowedLine.
	b edges useAssociations: associations.
	b layout tree.
	b build.
	^ b view
]
