*EarleyParser-UI
gtInspectorPureIn: composite
	<gtInspectorPresentationOrder: 1>
	^ composite table
		title: [ 'Pure' ];
		column: 'Name'
			evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each key ]
			width: 100;
		column: 'Value'
			evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each value ];
		send: [ :each | each value ];
		yourself