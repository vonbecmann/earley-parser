*EarleySyntaxTree-UI
gtInspectorASTIn: composite
	<gtInspectorPresentationOrder: 1>
	^ (tree gtInspectorBrowserIn: composite)
		title: 'AST';
		send: [ :each | each model ];
		yourself