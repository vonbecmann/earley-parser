Extension { #name : 'JERule' }

{ #category : '*EarleyParser-InspectorExtensions' }
JERule >> inspectionDottedRulesIn: aBuilder [

	<inspectorPresentationOrder: 2 title: 'Dotted Rules'>
	^ aBuilder newTable
		  alternateRowsColor;
		  addColumn: (SpStringTableColumn new
				   title: 'Dot Index';
				   evaluated: [ :each | each dotIndex ];
				   width: 75;
				   yourself);
		  addColumn:
		  (SpStringTableColumn
			   title: 'Dotted Rule'
			   evaluated: [ :each | each ]);
		  items: dottedRules;
		  yourself
]

{ #category : '*EarleyParser-InspectorExtensions' }
JERule >> inspectionPureIn: aBuilder [

	<inspectorPresentationOrder: 1 title: 'Pure'>
	^ aBuilder newTable
		  alternateRowsColor;
		  addColumn: (SpStringTableColumn new
				   title: 'Name';
				   evaluated: [ :each | each key ];
				   width: 100;
				   yourself);
		  addColumn:
		  (SpStringTableColumn
			   title: 'Value'
			   evaluated: [ :each | each value ]);
		  items: ({ ('head' -> self head) }
			   , (self body withIndexCollect: [ :each :index |
					    'body at: ' , index asString -> each ]) collect: [ :each |
				   StInspectorAssociationNode hostObject: each ]);
		  yourself
]
