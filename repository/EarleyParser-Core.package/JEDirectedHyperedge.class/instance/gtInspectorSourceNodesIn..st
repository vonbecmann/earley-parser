gt-inspector-extension
gtInspectorSourceNodesIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: 'Source Nodes';
		display: sourceNodes;
		column: 'Node' evaluated: [ :each | each ];
		showOnly: 50;
		yourself