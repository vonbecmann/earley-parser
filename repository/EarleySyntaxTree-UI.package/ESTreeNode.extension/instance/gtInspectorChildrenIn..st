*EarleySyntaxTree-UI
gtInspectorChildrenIn: composite
	<gtInspectorPresentationOrder: 2>
	^ composite list
		title: [ 'Children' ];
		display: [ children ];
		send: [ :each | each ];
		yourself