Extension { #name : #ESSingleSynthesizedAttributeEvaluator }

{ #category : #'*EarleySyntaxTree-InspectorExtensions' }
ESSingleSynthesizedAttributeEvaluator >> gtInspectorActionsIn: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: [ 'Actions' ];
		display:[ grammar productionRules collect: [ :rule | rule -> (ruleToAction at: rule ifAbsent: [ 'do nothing.' ]) ] ];
		column: 'Rule' evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each key ];
		column: 'Action' evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each value ];
		showOnly: 50;
		yourself
]
