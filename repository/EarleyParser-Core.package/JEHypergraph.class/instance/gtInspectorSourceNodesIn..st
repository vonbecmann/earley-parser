gt-inspector-extension
gtInspectorSourceNodesIn: composite
	<gtInspectorPresentationOrder: 2>
	^ composite table
		title: 'Source Nodes';
		display: nodes asOrderedCollection sort;
		column: 'Source Node (label, start chart, end chart)' evaluated: [ :each | each ];
		send: [ :each | self edgesForSource: each ];
		showOnly: 50;
		yourself