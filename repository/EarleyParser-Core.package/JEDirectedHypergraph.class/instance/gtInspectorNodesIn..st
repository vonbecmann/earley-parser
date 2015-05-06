gt-inspector-extension
gtInspectorNodesIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: nodes size asString , ' nodes';
		display: nodes;
		column: 'Node (label, start, end)' evaluated: [ :each | each ];
		send: [ :each | each sourceNodes asArray ];
		showOnly: 50;
		yourself