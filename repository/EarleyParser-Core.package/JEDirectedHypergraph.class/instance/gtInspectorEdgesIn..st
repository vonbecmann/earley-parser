gt-inspector-extension
gtInspectorEdgesIn: composite
	<gtInspectorPresentationOrder: 1>
	^ composite table
		title: edges size asString , ' hyperedges';
		display: edges asArray;
		column: 'Hyperedge' evaluated: [ :each | each ];
		showOnly: 50;
		yourself