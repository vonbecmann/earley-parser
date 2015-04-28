gt-inspector-extension
gtInspectorNodesIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: nodes size asString , ' nodes';
		display: nodes asOrderedCollection sort;
		column: 'Node (label, start, end)' evaluated: [ :each | each ];
		send: [ :each | self edgesForTarget: each ];
		showOnly: 50;
		yourself