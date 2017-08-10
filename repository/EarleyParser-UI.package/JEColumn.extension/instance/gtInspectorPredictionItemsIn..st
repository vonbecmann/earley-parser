*EarleyParser-UI
gtInspectorPredictionItemsIn: composite
	<gtInspectorPresentationOrder: 1>
	^ composite table
		title: [ 'Prediction' ];
		display: [ self predictionItemsByNonterminalAssociations ];
		send: [ :each | each value ];
		column: 'Nonterminal' evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each key ];
		column: 'Prediction Item'
			evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each value ];
		showOnly: 50;
		yourself