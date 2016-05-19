*EarleyUI
gtInspectorAlternativesIn: composite
	<gtInspectorPresentationOrder: 4>
	^ (alternatives gtInspectorItemsIn: composite)
		title: [ 'Alternatives' ];
		display: [ alternatives associations sorted: [ :a :b | nonterminalSort value: a key value: b key ] ];
		yourself