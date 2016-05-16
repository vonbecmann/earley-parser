*EarleyUI
gtInspectorDepthVisitIn: composite
	" TOO EXPENSIVE for large graphs
	<gtInspectorPresentationOrder: 4>"
	^ composite table
		title: 'Depth Visit';
		display: (self dvisitFrom: self root);
		column: 'Node' evaluated: [ :each | each ];
		showOnly: 50;
		yourself