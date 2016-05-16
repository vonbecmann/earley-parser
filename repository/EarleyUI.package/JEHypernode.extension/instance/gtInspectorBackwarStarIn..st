*EarleyUI
gtInspectorBackwarStarIn: composite
	<gtInspectorPresentationOrder: 2>
	^ composite table
		title: 'Backward Star';
		display: backwardStar;
		column: 'Edge' evaluated: [ :each | each ];
		showOnly: 50;
		yourself