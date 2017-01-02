*EarleyParser-UI
gtInspectorItemsByKeyIn: composite
	<gtInspectorPresentationOrder: 3>
	^ (itemsByKey gtInspectorItemsIn: composite)
		title: [ ' By Key' ];
		yourself