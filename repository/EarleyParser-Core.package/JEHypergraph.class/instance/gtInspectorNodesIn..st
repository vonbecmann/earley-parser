gt-inspector-extension
gtInspectorNodesIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: nodes size asString , ' nodes';
		display: nodes;
		column: 'Node' evaluated: [ :each | each ];
		showOnly: 50;
		yourself