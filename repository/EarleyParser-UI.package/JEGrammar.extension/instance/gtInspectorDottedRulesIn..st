*EarleyParser-UI
gtInspectorDottedRulesIn: composite
	<gtInspectorPresentationOrder: 6>
	^ (dottedRules gtInspectorItemsIn: composite)
		title: [ dottedRules size asString , ' Dotted Rules' ];
		display: [ dottedRules associations sorted: [ :a :b | ruleSort value: a key value: b key ] ];
		yourself