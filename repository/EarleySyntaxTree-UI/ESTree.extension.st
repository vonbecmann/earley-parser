Extension { #name : #ESTree }

{ #category : #'*EarleySyntaxTree-UI' }
ESTree >> gtInspectorBrowserIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ composite tree
		title: 'Browse';
		display: [ root ];
		children: [ :each | each children ];
		yourself
]

{ #category : #'*EarleySyntaxTree-UI' }
ESTree >> gtInspectorViewIn: composite [
	<gtInspectorPresentationOrder: 2>
	^ composite tree
		title: 'View';
		display: [ root ];
		children: [ :each | each children ];
		send: [ :each | self viewFor: each ];
		yourself
]

{ #category : #'*EarleySyntaxTree-UI' }
ESTree >> viewFor: aNode [
	" returns a roassal view of the given node"

	| nodes associations b |
	nodes := SinglyLinkedList new.
	associations := SinglyLinkedList new.
	ESTDepthFirstVisitor new
		preOrderBlock: [ :node | 
			nodes add: node.
			associations addAll: (node children collect: [ :child | node -> child ]) ];
		visitNode: aNode.
	b := RTMondrian new.
	b shape rectangle withTextAbove.
	b nodes: nodes asArray.
	b shape arrowedLine.
	b edges useAssociations: associations.
	b layout tree.
	b build.
	^ b view
]
