gt-inspector-extension
gtInspectorItemsIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: self size asString , ' items';
		display: items asArray;
		column: 'Dotted Rule @ Chart' evaluated: [ :each | each ];
		send: [ :each | self pointersFrom: each ];
		showOnly: 50;
		yourself