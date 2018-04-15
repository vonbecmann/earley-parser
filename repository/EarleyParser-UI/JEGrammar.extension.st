Extension { #name : #JEGrammar }

{ #category : #'*EarleyParser-UI' }
JEGrammar >> gtInspectorNonterminalsIn: composite [
	<gtInspectorPresentationOrder: 2>
	^ composite table
		title: [ nonterminals size asString , ' nonterminals' ];
		display: [ nonterminals asArray ];
		column: 'Nonterminals' evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each ];
		showOnly: 50;
		yourself
]

{ #category : #'*EarleyParser-UI' }
JEGrammar >> gtInspectorPredictedAlternativesIn: composite [
	<gtInspectorPresentationOrder: 5>
	^ (predictedAlternatives gtInspectorItemsIn: composite)
		title: [ predictedAlternatives size asString , ' Predicted Alternatives' ];
		display: [ predictedAlternatives associations ];
		yourself
]

{ #category : #'*EarleyParser-UI' }
JEGrammar >> gtInspectorRulesIn: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: [ alternatives size asString , ' rules' ];
		display: [ alternatives associations ];
		column: 'Key'
			evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each key ]
			width: 150;
		column: 'Rule'
			evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each value ];
		send: [ :each | each value ];
		showOnly: 50;
		yourself
]

{ #category : #'*EarleyParser-UI' }
JEGrammar >> gtInspectorTerminalsIn: composite [
	<gtInspectorPresentationOrder: 3>
	^ composite table
		title: [ terminals size asString , ' terminals' ];
		display: [ terminals ];
		column: 'Terminals' evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each ];
		showOnly: 50;
		yourself
]
