gt-inspector-extension
gtInspectorEdgesIn: composite
	<gtInspectorPresentationOrder: 1>
	^ composite table
		title: edges size asString , ' hyperedges';
		display: edges asArray;
		column: 'Target Node' evaluated: [ :each | each targetNode ];
		column: 'Source Nodes' evaluated: [ :each | each sourceNodes ];
		showOnly: 50;
		yourself