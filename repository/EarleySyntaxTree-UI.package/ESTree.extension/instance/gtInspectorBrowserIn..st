*EarleySyntaxTree-UI
gtInspectorBrowserIn: composite
	<gtInspectorPresentationOrder: 1>
	^ composite tree
		title: 'Browse';
		display: [ root ];
		children: [ :each | each children ];
		yourself