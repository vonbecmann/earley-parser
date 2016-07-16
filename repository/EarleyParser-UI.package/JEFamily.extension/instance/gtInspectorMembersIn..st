*EarleyParser-UI
gtInspectorMembersIn: composite
	<gtInspectorPresentationOrder: 1>
	^ composite table
		title: [ 'Members' ];
		display: [ self members ];
		column: 'Member' evaluated: [ :each | each ];
		showOnly: 50;
		yourself