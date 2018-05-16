Extension { #name : #ESTree }

{ #category : #'*EarleySyntaxTree-InspectorExtensions' }
ESTree >> gtInspectorBrowserIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ composite tree
		title: 'Browse';
		display: [ root ];
		children: [ :each | each children ];
		yourself
]
