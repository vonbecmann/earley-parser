*EarleyParser-UI
gtInspectorTerminalsIn: composite
	<gtInspectorPresentationOrder: 3>
	^ composite table
		title: [ terminals size asString , ' terminals' ];
		display: [ terminals ];
		column: 'Terminals' evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each ];
		showOnly: 50;
		yourself