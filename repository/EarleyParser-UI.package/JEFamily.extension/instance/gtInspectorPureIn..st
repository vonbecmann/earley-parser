*EarleyParser-UI
gtInspectorPureIn: composite
	<gtInspectorPresentationOrder: 2>
	^ composite table
		title: [ 'Pure' ];
		display: [ {('parent' -> parent)} ];
		column: 'Name' evaluated: [ :each | each key ] width: 75;
		column: 'Value' evaluated: [ :each | each value ];
		send: [ :each | each value ];
		yourself