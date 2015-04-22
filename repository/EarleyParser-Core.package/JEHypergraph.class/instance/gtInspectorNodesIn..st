gt-inspector-extension
gtInspectorNodesIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: nodes size asString , ' nodes';
		display: nodes asArray;
		column: 'Node (label, start chart, end chart)' evaluated: [ :each | each ];
		send: [ :each | self edgesFor: each ];
		showOnly: 50;
		yourself