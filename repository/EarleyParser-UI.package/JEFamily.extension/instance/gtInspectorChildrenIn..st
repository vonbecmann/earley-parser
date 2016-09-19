*EarleyParser-UI
gtInspectorChildrenIn: composite
	<gtInspectorPresentationOrder: 1>
	^ composite table
		title: [ 'Children' ];
		display: [ self children ];
		column: 'Child' evaluated: [ :each | each ];
		showOnly: 50;
		yourself