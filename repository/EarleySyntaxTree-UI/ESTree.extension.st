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
	^ composite roassal2
		title: 'View';
		initializeView: [ self view ];
		yourself
]

{ #category : #'*EarleySyntaxTree-UI' }
ESTree >> view [
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
	b nodes: nodes asArray.
	b shape arrowedLine.
	b edges useAssociations: associations.
	b layout tree.
	b build.
	^ b view
]
