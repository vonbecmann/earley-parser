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
JEColumn >> gtInspectorItemsIn: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: [ self size asString , ' items' ];
		display: [ self sortedItems ];
		column: '@ [start, end]' evaluated: [ :each | each gtDisplayIntervalString ] width: 100;
		column: 'Value' evaluated: [ :each | each gtDisplayValueString ];
		showOnly: 50;
		yourself
]

{ #category : #'*EarleyParser-InspectorExtensions' }
JEColumn >> gtInspectorPredictionItemsIn: composite [
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
	itemsByKey associationsDo: [ :assoc | assoc value do: [ :each | sortedItems add: each ] ].
	^ sortedItems
]
