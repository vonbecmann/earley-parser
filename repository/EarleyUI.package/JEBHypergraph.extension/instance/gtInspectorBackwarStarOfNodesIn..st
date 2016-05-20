*EarleyUI
gtInspectorBackwarStarOfNodesIn: composite
	<gtInspectorPresentationOrder: 2>
	^ composite table
		title: [ 'Backward Star' ];
		display: [ nodes ];
		column: 'Node' evaluated: [ :each | each ];
		send: [ :each | each backwardStar ];
		showOnly: 50;
		yourself