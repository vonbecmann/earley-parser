gt-inspector-extension
gtInspectorEdgesIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: edges size asString , ' edges';
		display: edges;
		column: 'Label (From, To)' evaluated: [ :each | each ];
		send: [ :each | each to ];
		showOnly: 50;
		yourself