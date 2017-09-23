*EarleySyntaxTree-UI
gtInspectorBrowseIn: composite
	<gtInspectorPresentationOrder: 1>
	^ (tree gtInspectorBrowserIn: composite)
		title: 'Browse';
		send: [ :each | each model ];
		yourself