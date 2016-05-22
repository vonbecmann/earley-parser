*EarleyUI
gtInspectorItemsByKeyIn: composite
	<gtInspectorPresentationOrder: 3>
	^ composite table
		title: [ ' By Key' ];
		display: [ itemsByKey associations ];
		send: [ :each | each value ];
		column: '(start chart . item''s key)' evaluated: [ :each | each key ] width: 150;
		column: 'Item' evaluated: [ :each | each value ];
		showOnly: 50;
		yourself