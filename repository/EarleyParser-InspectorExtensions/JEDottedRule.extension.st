Extension { #name : 'JEDottedRule' }

{ #category : '*EarleyParser-InspectorExtensions' }
JEDottedRule >> inspectionPureIn: aBuilder [

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
		  items: ({
				   ('rule' -> self rule).
				   ('dotIndex' -> self dotIndex).
				   ('symbolAtDot' -> self symbolAtDot).
				   ('predicted' -> self isPredicted).
				   ('active' -> self isActive).
				   ('final' -> self isFinal).
				   ('next Dotted Rule' -> next) } collect: [ :each |
				   StInspectorAssociationNode hostObject: each ]);
		  yourself
]
