*EarleyUI
gtInspectorSourceNodesIn: composite
	<gtInspectorPresentationOrder: 1>
	^ composite table
		title: [ 'Source Nodes' ];
		display: [ sourceNodes ];
		column: 'Node' evaluated: [ :each | each ];
		showOnly: 50;
		yourself