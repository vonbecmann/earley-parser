*EarleyParser-UI
gtInspectorRulesIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: [ alternatives size asString , ' rules' ];
		display: [ alternatives associations ];
		column: 'Key'
			evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each key ]
			width: 150;
		column: 'Rule'
			evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each value ];
		send: [ :each | each value ];
		showOnly: 50;
		yourself