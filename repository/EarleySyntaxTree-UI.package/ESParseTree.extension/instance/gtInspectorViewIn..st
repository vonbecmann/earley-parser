*EarleySyntaxTree-UI
gtInspectorViewIn: composite
	<gtInspectorPresentationOrder: 2>
	^ (tree gtInspectorViewIn: composite)
		send: [ :each | each model ];
		yourself