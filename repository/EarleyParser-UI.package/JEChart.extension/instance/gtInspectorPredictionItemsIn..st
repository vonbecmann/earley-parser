*EarleyParser-UI
gtInspectorPredictionItemsIn: composite
	<gtInspectorPresentationOrder: 1>
	^ composite table
		title: [ 'Prediction' ];
		display: [ predictionItemsByNonterminal associations ];
		send: [ :each | each value ];
		column: 'Nonterminal' evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each key ];
		column: 'Prediction Items'
			evaluated: [ :each | 
			(String streamContents: [ :s | each value do: [ :item | item printOn: s ] separatedBy: [ s nextPutAll: ', ' ] ])
				truncateWithElipsisTo: 50 ];
		showOnly: 50;
		yourself