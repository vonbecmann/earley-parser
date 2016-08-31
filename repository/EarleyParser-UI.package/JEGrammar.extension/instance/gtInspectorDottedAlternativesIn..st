*EarleyParser-UI
gtInspectorDottedAlternativesIn: composite
	<gtInspectorPresentationOrder: 5>
	^ (dottedAlternatives gtInspectorItemsIn: composite)
		title: [ dottedAlternatives size asString , ' Dotted Alternatives' ];
		display: [ dottedAlternatives associations
				sorted: [ :a :b | nonterminalSort value: a key value: b key ] ];
		yourself