Extension { #name : #ESSyntaxNode }

{ #category : #'*EarleySyntaxTree-InspectorExtensions' }
ESSyntaxNode >> inspectionPureIn: aBuilder [

	<inspectorPresentationOrder: 1 title: 'Pure'>
	^ aBuilder newTable
		  addColumn: (SpStringTableColumn new
				   title: 'Name';
				   evaluated: [ :each | each key ];
				   width: 100;
				   yourself);
		  addColumn:
		  (SpStringTableColumn
			   title: 'Value'
			   evaluated: [ :each | each value ]);
		  items: ({ 
				   ('symbol' -> symbol).
				   ('reason' -> reason).
				   ('start index' -> start).
				   ('end index' -> end) } collect: [ :each | 
				   StInspectorAssociationNode hostObject: each ]);
		  yourself
]
