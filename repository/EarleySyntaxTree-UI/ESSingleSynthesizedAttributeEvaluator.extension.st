Extension { #name : #ESSingleSynthesizedAttributeEvaluator }

{ #category : #'*EarleySyntaxTree-UI' }
ESSingleSynthesizedAttributeEvaluator >> gtInspectorActionsIn: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite list
		title: [ ruleToAction size asString , ' actions' ];
		display: [ ruleToAction associations ];
		format: [ :each | each asString ];
		send: [ :each | each ];
		showOnly: 50;
		yourself
]
