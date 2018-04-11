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
	^ composite roassal2
		title: 'View';
		initializeView: [ self view ]
]

{ #category : #'*EarleyParser-UI' }
JEBSPPForest >> view [
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
		visit: self.
	
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
