Extension { #name : #JEGrammar }

{ #category : #'*EarleyParser-InspectorExtensions' }
JEGrammar >> gtInspectorNonterminalsIn: composite [
	<gtInspectorPresentationOrder: 2>
	^ composite table
		title: [ nonterminals size asString , ' nonterminals' ];
		display: [ productionRules keys ];
		column: 'Nonterminals' evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each ];
		send: [ :each | productionRules at: each ];
		showOnly: 50;
		yourself
]

{ #category : #'*EarleyParser-InspectorExtensions' }
JEGrammar >> gtInspectorProductionRulesIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ composite table
		title: [ 'production rules' ];
		display: [ productionRules values ];
		column: 'Production Rule' evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each ];
		send: [ :each | each value ];
		showOnly: 50;
		yourself
]

{ #category : #'*EarleyParser-InspectorExtensions' }
JEGrammar >> gtInspectorRulesIn: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: [ productionRules size asString , ' rules' ];
		display: [ 
			productionRules keys 
				flatCollect:
					[ :nonterminal | 
						(productionRules at: nonterminal) 
							collectWithIndex: [ :each :index | nonterminal -> index -> each ] ] ];
		column: 'Key' evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each key ] width: 150;
		column: 'Rule' evaluated: [ :each | GTObjectPrinter new asTruncatedTextFrom: each value ];
		send: [ :each | each value ];
		showOnly: 50;
		yourself
]
