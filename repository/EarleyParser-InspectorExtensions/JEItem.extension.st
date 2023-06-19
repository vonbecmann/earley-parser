Extension { #name : #JEItem }

{ #category : #'*EarleyParser-InspectorExtensions' }
JEItem >> displayIntervalString [
	^ String streamContents: [ :s | self printIntervalOn: s ]
]

{ #category : #'*EarleyParser-InspectorExtensions' }
JEItem >> displayValueOn: aStream [
	^ self subclassResponsibility
]

{ #category : #'*EarleyParser-InspectorExtensions' }
JEItem >> displayValueString [
	^ String streamContents: [ :s | self displayValueOn: s ]
]

{ #category : #'*EarleyParser-InspectorExtensions' }
JEItem >> inspectionPureIn: aBuilder [

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
		  yourself
]
