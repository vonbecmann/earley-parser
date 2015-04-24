gt-inspector-extension
gtInspectorNodesIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: nodes size asString , ' nodes';
		display: nodes asOrderedCollection sort;
		column: 'Node (label, start chart, end chart)' evaluated: [ :each | each ];
		showOnly: 50;
		yourself