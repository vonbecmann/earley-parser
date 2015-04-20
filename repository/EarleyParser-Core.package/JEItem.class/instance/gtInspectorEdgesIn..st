gt-inspector-extension
gtInspectorEdgesIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: edges size asString , ' edges';
		display: edges;
		column: 'Label' evaluated: [ :each | each descriptionLabel ];
		column: 'To' evaluated: [ :each | each to ];
		send: [ :each | each to ];
		showOnly: 50;
		yourself