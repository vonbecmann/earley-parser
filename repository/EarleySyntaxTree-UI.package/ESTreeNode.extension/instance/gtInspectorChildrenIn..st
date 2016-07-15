*EarleySyntaxTree-UI
gtInspectorChildrenIn: composite
	<gtInspectorPresentationOrder: 1>
	^ composite list
		title: [ 'Children' ];
		display: [ children asArray ];
		send: [ :each | each ];
		yourself