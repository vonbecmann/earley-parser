Extension { #name : #JEPackedNode }

{ #category : #'*EarleyParser-InspectorExtensions' }
JEPackedNode >> gtInspectorBrowserIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ composite tree
		title: 'Browse';
		display: [ self ];
		children: [ :each | each children ];
		yourself
]
