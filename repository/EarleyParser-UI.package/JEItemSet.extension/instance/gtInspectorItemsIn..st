*EarleyParser-UI
gtInspectorItemsIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: [ self size asString , ' items' ];
		display: [ itemsByKey asArray sort: [:a :b | a start <= b start ]; yourself ];
		column: '@ [start, end]' evaluated: [ :each | each gtDisplayIntervalString ] width: 100;
		column: 'Value' evaluated: [ :each | each gtDisplayValueString ];
		showOnly: 50;
		yourself