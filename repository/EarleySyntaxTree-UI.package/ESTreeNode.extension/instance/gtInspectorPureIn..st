*EarleySyntaxTree-UI
gtInspectorPureIn: composite
	<gtInspectorPresentationOrder: 2>
	^ composite table
		title: [ 'Pure' ];
		display: [ {('model' -> self model)} ];
		column: 'Name' evaluated: [ :each | each key ] width: 75;
		column: 'Value' evaluated: [ :each | each value ];
		send: [ :each | each value ];
		yourself