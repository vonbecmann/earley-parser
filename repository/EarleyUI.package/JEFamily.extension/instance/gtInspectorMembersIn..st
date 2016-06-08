*EarleyUI
gtInspectorMembersIn: composite
	<gtInspectorPresentationOrder: 2>
	^ composite table
		title: [ 'Members' ];
		display: [ members ];
		column: 'Member' evaluated: [ :each | each ];
		showOnly: 50;
		yourself