Extension { #name : #ESTreeNode }

{ #category : #'*EarleySyntaxTree-InspectorExtensions' }
ESTreeNode >> gtInspectorBrowserIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ composite tree
		title: 'Browse';
		display: [ self ];
		children: [ :each | each children ];
		yourself
]
