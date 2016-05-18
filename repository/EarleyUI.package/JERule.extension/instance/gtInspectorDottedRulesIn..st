*EarleyUI
gtInspectorDottedRulesIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: [ 'Dotted Rules' ];
		display: [ dottedRules ];
		column: 'Dot Index' evaluated: [ :each | each dotIndex ] width: 75;
		column: 'Dotted Rule' evaluated: [ :each | each ];
		showOnly: 50;
		yourself