*EarleyUI
gtInspectorMembersIn: composite
	<gtInspectorPresentationOrder: 2>
	^ composite table
		title: [ 'Members' ];
		display: [ self members asArray ];
		column: 'Member' evaluated: [ :each | each ];
		showOnly: 50;
		yourself