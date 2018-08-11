Extension { #name : #JEFamily }

{ #category : #'*EarleyParser-InspectorExtensions' }
JEFamily >> gtInspectorBrowserIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ composite tree
		title: 'Browse';
		display: [ self ];
		children: [ :each | each children ];
		yourself
]
