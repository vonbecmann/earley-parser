*EarleyUI
gtInspectorItemsIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: self size asString , ' items';
		display: items asArray;
		column: 'Dotted Rule' evaluated: [ :each | each dottedRule ];
		column: '@ [start, end]' evaluated: [ :each | each gtDisplayChartString ];
		showOnly: 50;
		yourself