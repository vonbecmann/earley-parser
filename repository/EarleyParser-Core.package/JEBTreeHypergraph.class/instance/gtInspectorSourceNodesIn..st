gt-inspector-extension
gtInspectorSourceNodesIn: composite
	<gtInspectorPresentationOrder: 3>
	^ composite table
		title: 'Source Nodes';
		display: nodes;
		column: 'Node' evaluated: [ :each | each ];
		send: [ :each | (sourceNodesByTarget at: each) asArray ];
		showOnly: 50;
		yourself