Extension { #name : #ESSingleSynthesizedAttributeEvaluator }

{ #category : #'*EarleySyntaxTree-InspectorExtensions' }
ESSingleSynthesizedAttributeEvaluator >> inspectionActionsIn: aBuilder [

	<inspectorPresentationOrder: 1 title: 'Actions'>
	^ aBuilder newTable
		  addColumn:
			  (SpStringTableColumn
				   title: 'Rule'
				   evaluated: [ :each | each key ]);
		  addColumn:
			  (SpStringTableColumn
				   title: 'Action'
				   evaluated: [ :each | each value ]);
		  items: (grammar productionRules collect: [ :rule | 
					   StInspectorAssociationNode hostObject:
							   rule -> (ruleToAction at: rule ifAbsent: [ 'do nothing.' ]) ]);
		  yourself
]
