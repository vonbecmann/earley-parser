*EarleyUI
gtInspectorAlternativesIn: composite
	<gtInspectorPresentationOrder: 4>
	^ composite table
		title: [ 'Alternatives' ];
		display: [ alternatives associations ];
		column: 'Key' evaluated: [ :each | each key ] width: 100;
		column: 'Rule' evaluated: [ :each | each value ];
		showOnly: 50;
		yourself