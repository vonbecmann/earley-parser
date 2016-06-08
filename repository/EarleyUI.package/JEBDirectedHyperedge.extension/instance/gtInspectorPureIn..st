*EarleyUI
gtInspectorPureIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: [ 'Pure' ];
		display: [ {('target node' -> self targetNode)} ];
		column: 'Name' evaluated: [ :each | each key ] width: 75;
		column: 'Value' evaluated: [ :each | each value ];
		send: [ :each | each value ];
		yourself