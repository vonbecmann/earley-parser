*EarleySyntaxTree-UI
gtInspectorChildrenIn: composite
	<gtInspectorPresentationOrder: 1>
	^ composite list
		title: [ 'Children' ];
		display: [ children ];
		send: [ :each | each ];
		yourself