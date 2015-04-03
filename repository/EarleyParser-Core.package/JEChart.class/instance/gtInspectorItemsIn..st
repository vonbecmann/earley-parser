inspector
gtInspectorItemsIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: self size asString , ' items';
		display: items;
		column: 'Dotted Rule @ Chart' evaluated: [ :each | each ];
		showOnly: 50;
		yourself