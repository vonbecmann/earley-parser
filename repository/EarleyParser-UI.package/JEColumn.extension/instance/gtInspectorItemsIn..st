*EarleyParser-UI
gtInspectorItemsIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: [ self size asString , ' items' ];
		display: [ self sortedItems ];
		column: '@ [start, end]' evaluated: [ :each | each gtDisplayIntervalString ] width: 100;
		column: 'Value' evaluated: [ :each | each gtDisplayValueString ];
		showOnly: 50;
		yourself