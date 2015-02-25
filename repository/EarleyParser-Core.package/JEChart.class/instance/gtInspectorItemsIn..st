inspector
gtInspectorItemsIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: self size asString , ' items';
		display: items;
		column: 'Dotted Rule' evaluated: [ :each | each rule ];
		column: 'Chart' evaluated: [ :each | each chart ];
		showOnly: 50;
		yourself