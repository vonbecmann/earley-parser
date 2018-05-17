Extension { #name : #JEBSPPForest }

{ #category : #'*EarleyParser-InspectorExtensions' }
JEBSPPForest >> gtInspectorBrowserIn: composite [
	<gtInspectorPresentationOrder: 9>
	^ composite tree
		title: 'Browse';
		display: [ root ];
		children: [ :each | each children ];
		yourself
]
