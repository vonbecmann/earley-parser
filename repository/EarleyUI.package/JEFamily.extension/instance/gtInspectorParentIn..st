*EarleyUI
gtInspectorParentIn: composite
	<gtInspectorPresentationOrder: 3>
	^ composite table
		title: [ 'Parent' ];
		display: [ {parent} ];
		column: 'Packed Node' evaluated: [ :each | each ];
		showOnly: 50;
		yourself