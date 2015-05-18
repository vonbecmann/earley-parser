gt-inspector-extension
gtInspectorBackwarStarOfNodesIn: composite
	<gtInspectorPresentationOrder: 2>
	^ composite table
		title: 'Backward star of a node';
		display: nodes;
		column: 'Node (label, start, end)' evaluated: [ :each | each ];
		send: [ :each | self backwardStarOf: each ];
		showOnly: 50;
		yourself