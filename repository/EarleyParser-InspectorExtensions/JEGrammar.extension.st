Extension { #name : 'JEGrammar' }

{ #category : '*EarleyParser-InspectorExtensions' }
JEGrammar >> inspectionNonterminalsIn: aBuilder [

	<inspectorPresentationOrder: 2 title: 'nonterminals'>
	^ aBuilder newTable
		  alternateRowsColor;
		  addColumn: (SpStringTableColumn new
				   title: 'Nonterminal';
				   evaluated: [ :each |
					   StObjectPrinter asTruncatedTextFrom: each key ];
				   yourself);
		  items: (productionRules keys collect: [ :nonterminal |
					   StInspectorAssociationNode hostObject:
						   nonterminal -> (productionRules at: nonterminal) ]);
		  yourself
]

{ #category : '*EarleyParser-InspectorExtensions' }
JEGrammar >> inspectionProductionRulesIn: aBuilder [

	<inspectorPresentationOrder: 1 title: 'production rules'>
	^ aBuilder newTable
		  alternateRowsColor;
		  addColumn: (SpStringTableColumn new
				   title: 'Production Rule';
				   evaluated: [ :each | StObjectPrinter asTruncatedTextFrom: each ]);
		  items: productionRules values;
		  yourself
]

{ #category : '*EarleyParser-InspectorExtensions' }
JEGrammar >> inspectionRulesIn: aBuilder [

	<inspectorPresentationOrder: 0 title: 'rules'>
	^ aBuilder newTable
		  alternateRowsColor;
		  addColumn: (SpStringTableColumn new
				   title: 'Key';
				   evaluated: [ :each |
					   StObjectPrinter asTruncatedTextFrom: each key ];
				   yourself);
		  addColumn: (SpStringTableColumn new
				   title: 'Rule';
				   evaluated: [ :each |
					   StObjectPrinter asTruncatedTextFrom: each value ];
				   yourself);
		  items: (productionRules keys flatCollect: [ :nonterminal |
					   (productionRules at: nonterminal) collectWithIndex: [
						   :each
						   :index |
						   StInspectorAssociationNode hostObject:
							   nonterminal -> index -> each ] ]);
		  yourself
]
