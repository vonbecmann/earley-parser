gt-inspector-extension
gtInspectorTargetNodeIn: composite
	<gtInspectorPresentationOrder: 1>
	^ composite table
		title: 'Target Node';
		display: targetNode;
		column: 'Node (label, start, end)' evaluated: [ :each | each ];
		yourself