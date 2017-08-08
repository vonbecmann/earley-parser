*EarleyParser-UI
gtInspectorCompletedItemsIn: composite
	<gtInspectorPresentationOrder: 2>
	^ composite table
		title: [ 'Completed Here' ];
		display: [ finalItemsByNonterminal associations ];
		send: [ :each | each value ];
		column: 'Nonterminal' evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each key ];
		column: 'Completed(final) Item'
			evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each value ];
		showOnly: 50;
		yourself