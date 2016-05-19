*EarleyUI
gtInspectorTerminalsIn: composite
	<gtInspectorPresentationOrder: 3>
	^ composite table
		title: [ terminals size asString , ' terminals' ];
		display: [ terminals ];
		column: 'Terminals' evaluated: [ :each | each ];
		showOnly: 50;
		yourself