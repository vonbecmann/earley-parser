*EarleyParser-UI
gtInspectorPredictedAlternativesIn: composite
	<gtInspectorPresentationOrder: 5>
	^ (predictedAlternatives gtInspectorItemsIn: composite)
		title: [ predictedAlternatives size asString , ' Predicted Alternatives' ];
		display: [ predictedAlternatives associations sorted: [ :a :b | nonterminalSort value: a key value: b key ] ];
		yourself