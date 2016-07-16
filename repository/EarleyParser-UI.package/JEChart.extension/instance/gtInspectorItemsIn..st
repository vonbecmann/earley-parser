*EarleyParser-UI
gtInspectorItemsIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: [ self size asString , ' items' ];
		display: [ items asArray ];
		column: '@ [start, end]' evaluated: [ :each | each gtDisplayChartString ] width: 100;
		column: 'Dotted Rule' evaluated: [ :each | each dottedRule ];
		showOnly: 50;
		yourself