*EarleyUI
gtInspectorPureIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: [ 'Pure' ];
		display: [ self gtInspectorVariableValuePairs reject: [ :each | each key = #sourceNodes ] ];
		column: 'Name' evaluated: [ :each | each key ];
		column: 'Value' evaluated: [ :each | each value ];
		send: [ :each | each value ];
		yourself