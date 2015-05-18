gt-inspector-extension
gtInspectorNodesIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: nodes size asString , ' nodes';
		display: nodes;
		column: 'Node (label, start, end)' evaluated: [ :each | each ];
		send: [ :each | (self sourceNodesAt: each) asArray ];
		showOnly: 50;
		yourself