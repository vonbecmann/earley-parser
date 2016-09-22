*EarleyParser-UI
gtInspectorDottedRulesIn: composite
	<gtInspectorPresentationOrder: 6>
	^ (dottedRules gtInspectorItemsIn: composite)
		title: [ dottedRules size asString , ' Dotted Rules' ];
		yourself