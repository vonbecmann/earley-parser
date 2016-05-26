*EarleyUI
gtInspectorFamiliesIn: composite
	<gtInspectorPresentationOrder: 2>
	^ composite table
		title: [ 'Families' ];
		display: [ families ];
		column: 'Family' evaluated: [ :each | each ];
		showOnly: 50;
		yourself