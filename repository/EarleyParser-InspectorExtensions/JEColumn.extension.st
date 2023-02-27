Extension { #name : #JEColumn }

{ #category : #'*EarleyParser-InspectorExtensions' }
JEColumn >> finalItemsByNonterminalAssociations [
	^ Array
		streamContents: [ :s | 
			finalItemsByNonterminal
				associationsDo:
					[ :assoc | 
						assoc value 
							do: [ :each | s nextPut: (Association key: assoc key value: each) ] ] ]
]

{ #category : #'*EarleyParser-InspectorExtensions' }
JEColumn >> gtInspectorCompletedItemsIn: composite [
	<gtInspectorPresentationOrder: 2>
	^ composite table
		title: [ 'Completed Here' ];
		display: [ self finalItemsByNonterminalAssociations ];
		send: [ :each | each value ];
		column: 'Nonterminal' evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each key ];
		column: 'Completed(final) Item'
			evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each value ];
		showOnly: 50;
		yourself
]

{ #category : #'*EarleyParser-InspectorExtensions' }
JEColumn >> inspectionItemsIn: aBuilder [

	<inspectorPresentationOrder: 0 title: 'Items'>
	^ aBuilder newTable
		  addColumn: (SpStringTableColumn new
				   title: '@ [start, end]';
				   evaluated: [ :each | each gtDisplayIntervalString ];
				   width: 100;
				   yourself);
		  addColumn: (SpStringTableColumn
				   title: 'Value'
				   evaluated: [ :each | each gtDisplayValueString ]);
		  items: self sortedItems;
		  yourself
]

{ #category : #'*EarleyParser-InspectorExtensions' }
JEColumn >> inspectionPredictionItemsIn: aBuilder [

	<inspectorPresentationOrder: 1 title: 'Prediction'>
	^ aBuilder newTable
		  addColumn: (SpStringTableColumn new
				   title: 'Nonterminal';
				   evaluated: [ :each | each key ];
				   width: 100;
				   yourself);
		  addColumn: (SpStringTableColumn
				   title: 'Prediction Item'
				   evaluated: [ :each | each value ]);
		  items: self predictionItemsByNonterminalAssociations;
		  yourself
]

{ #category : #'*EarleyParser-InspectorExtensions' }
JEColumn >> predictionItemsByNonterminalAssociations [
	^ Array
		streamContents: [ :s | 
			predictionItemsByNonterminal
				associationsDo:
					[ :assoc | 
						assoc value 
							do: [ :each | s nextPut: (Association key: assoc key value: each) ] ] ]
]

{ #category : #'*EarleyParser-InspectorExtensions' }
JEColumn >> sortedItems [
	| sortedItems |
	sortedItems := SortedCollection new.
	sortedItems sortBlock: [ :a :b | a start <= b start ].
	sortedItems addAll: items.
	^ sortedItems
]
