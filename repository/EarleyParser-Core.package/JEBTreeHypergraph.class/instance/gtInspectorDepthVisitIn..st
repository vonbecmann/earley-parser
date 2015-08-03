gt-inspector-extension
gtInspectorDepthVisitIn: composite
	<gtInspectorPresentationOrder: 4>
	^ composite table
		title: 'Depth Visit';
		display: (self dvisitFrom: self root);
		column: 'Node' evaluated: [ :each | each ];
		showOnly: 50;
		yourself