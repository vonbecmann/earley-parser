gt-inspector-extension
gtInspectorEdgesIn: composite
	<gtInspectorPresentationOrder: 1>
	^ composite table
		title: edges size asString , ' edges';
		display: edges asArray;
		column: 'Label' evaluated: [ :each | each descriptionLabel ];
		column: 'From' evaluated: [ :each | each from ];
		column: 'To' evaluated: [ :each | each to ];
		showOnly: 50;
		yourself