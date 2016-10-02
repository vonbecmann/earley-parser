*EarleySyntaxTree-UI
gtInspectorBrowserIn: composite
	<gtInspectorPresentationOrder: 1>
	^ (tree gtInspectorBrowserIn: composite)
		send: [ :each | each model ];
		yourself