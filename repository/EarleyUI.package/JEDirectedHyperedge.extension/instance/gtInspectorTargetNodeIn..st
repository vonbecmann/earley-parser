*EarleyUI
gtInspectorTargetNodeIn: composite
	<gtInspectorPresentationOrder: 1>
	^ composite table
		title: 'Target Node';
		display: targetNode;
		column: 'Node' evaluated: [ :each | each ];
		yourself